// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/phdProvider.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/model/Customer/Features.dart';
import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SelectFeature extends ConsumerStatefulWidget {
  final VoidCallback setState;
  const SelectFeature({Key? key, required this.setState}) : super(key: key);

  @override
  ConsumerState<SelectFeature> createState() => _SelectFeatureState();
}

class _SelectFeatureState extends ConsumerState<SelectFeature> {
  late PhdProvider _phdProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loaddata();
    log("room id ==$roomid");
    _phdProvider = ref.read(phdProvider);
    if (mounted) {
      setState(() {});
    }
  }

  int indexs = 0;
  bool loading = true;
  // bool dataLoading = false;
  // bool Fireplace = false;
  // bool hasBasement = false;
  // bool Upgraded_Appliances = false;
  // bool Custom_Cabinetry = false;
  // bool DAZLING = false;
  // bool MARKET_READY = false;
  // bool NEEDS_DAZL = false;
  // List<int> featureId = [];
  // bool more = false;
  // bool moresecond = false;
  // List<String> _description2 = <String>[];
  // List<TextEditingController> _DescrptionController2 = [];

  // TextEditingController _DescrptionController = TextEditingController();
  // String _description = "";
  // List<File> imgFile = [];
  // List<List<File>> roomDetailImg = [];
  // final imgPicker = ImagePicker();
  // List<List<bool>> select = [];
  // List<List<int>> featureissueId = [];
  // List<int> selectedbox = [];
  // List selectedCheckbox = [];
  // List<List<String>> FeatureissueName = [];
  // List<List<int>> FeatureissueId = [];
  // List<bool> DataLoding = [];

  Widget build(BuildContext context) {
    final _roomsfeature = ref.read(customernotifier);
    final _reltorProvider = ref.read(realtorprovider);
    _phdProvider = ref.watch(
      phdProvider,
    );
    final size = MediaQuery.of(context).size;
    // print("cndcndlcn" + _reltorProvider.addValueData.toString());
    return SafeArea(
      child: Scaffold(
        body: _phdProvider.status != Status.complited
            ? LoadingWidget()
            : Column(
                children: [
                  // Container(
                  //   height: size.height * 0.08,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(20),
                  //         bottomRight: Radius.circular(20),
                  //       ),
                  //       color: AppTheme.colorPrimary),
                  //   child: Center(
                  //     child: Text(
                  //       "Create a Project",
                  //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  //             fontSize: 16,
                  //             color: lightColor.withOpacity(.9),
                  //           ),
                  //     ),
                  //   ),
                  // ),

                  Expanded(
                    child:
                        // loading
                        //     ? LoadingWidget()
                        //     :
                        Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          _phdProvider.roomIdList[_phdProvider.tabIndex] == 7
                              ? SizedBox(
                                  width: size.width,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        activeColor: AppTheme.colorPrimary,
                                        value: _phdProvider.hasBasement,
                                        onChanged: (value) {
                                          setState(() {
                                            _phdProvider.hasBasement = value!;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Has the basement been finished since last real estate transaction",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Text(
                              "1. Note any exceptional features or selling advantage:"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: size.height * 0.12,
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppTheme.grey.withOpacity(0.5),
                                    width: 2),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: _phdProvider.DescrptionController[
                                      _phdProvider.tabIndex],
                                  minLines: 2,
                                  maxLines: 100,
                                  textInputAction: TextInputAction.done,
                                  cursorColor: AppTheme.colorPrimary,
                                  decoration: InputDecoration(
                                      hintText: "Add note to inspection report",
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                                // Align(
                                //   alignment: Alignment.centerRight,
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       color: AppTheme.colorPrimary,
                                //       borderRadius: BorderRadius.only(
                                //         bottomLeft: Radius.circular(10),
                                //         topLeft: Radius.circular(10),
                                //       ),
                                //     ),
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.arrow_forward_ios,
                                //         color: Colors.white,
                                //       ),
                                //       onPressed: () {
                                //         _DescrptionController.text.isEmpty
                                //             ? ScaffoldMessenger.of(context)
                                //                 .showSnackBar(SnackBar(
                                //                 content:
                                //                     Text('Add description'),
                                //               ))
                                //             : _description =
                                //                 _DescrptionController.text;
                                //         _DescrptionController.clear();
                                //       },
                                //     ),
                                //     width: 50,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  "2. Add photos of exceptional features or selling advantages",
                                  maxLines: 2,
                                ),
                              ),
                              // IconButton(
                              //     // padding: EdgeInsets.zero,
                              //     onPressed: () {
                              //       showOptionsDialog(context, 0, 0);
                              //     },
                              //     icon: Icon(
                              //       Icons.add_box,
                              //       color:
                              //           AppTheme.colorPrimary.withOpacity(0.6),
                              //     ))
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     showOptionsDialog(context, 0, 0);
                          //   },
                          //   child: Row(
                          //     children: [
                          //       Container(
                          //         width: size.width * 0.83,
                          //         padding: EdgeInsets.only(
                          //             top: 7, bottom: 7, left: 12, right: 12),
                          //         decoration: BoxDecoration(
                          //             color: AppTheme.colorPrimary
                          //                 .withOpacity(0.4),
                          //             borderRadius: BorderRadius.circular(15)),
                          //         child: Center(
                          //           child: Text('Add Photos'),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       CircleAvatar(
                          //         radius: 18,
                          //         backgroundColor:
                          //             AppTheme.colorPrimary.withOpacity(0.6),
                          //         child: IconButton(
                          //             onPressed: () {
                          //               if (imgGallery != null) {
                          //                 textphoto();
                          //               }
                          //               if (imgCamera != null) {
                          //                 photocamera();
                          //               }
                          //             },
                          //             icon: Icon(
                          //               Icons.send,
                          //               color: Colors.white,
                          //               size: 18,
                          //             )),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          //
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                //  _phdProvider.moresecond
                                //     ? _phdProvider
                                //             .mainImgFile[_phdProvider.tabIndex].length +
                                //         2
                                //     : _phdProvider.mainImgFile[_phdProvider.tabIndex]
                                //                 .length >=
                                //             10
                                //         ? 11
                                //         :
                                _phdProvider.mainImgFile[_phdProvider.tabIndex]
                                        .length +
                                    1,
                            itemBuilder: (BuildContext context, int Index) {
                              if (Index == 0) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        showOptionsDialog(context, 0, 0, true);
                                      },
                                      icon: Icon(Icons.add_a_photo)),
                                );
                              }
                              // log("sxsjkbsjxbsakjb" +
                              //     Index
                              //         .toString());
                              // log("sxsjkbsjxbsakjb====" +
                              //     roomDetailImg[
                              //             index]
                              //         .length
                              //         .toString());
                              // log("sxsjkbsjxbsakjb--->" +
                              //     lessindex
                              //         .toString());
                              return
                                  // roomDetailImg[
                                  //                 index]
                                  //             [
                                  //             Index] ==
                                  //         File('')
                                  //     ? SizedBox()
                                  //     :
                                  // Index <= 8 && _phdProvider.moresecond == false
                                  //     ? GestureDetector(
                                  //         onTap: () {
                                  //           setState(() {
                                  //             _phdProvider.moresecond = true;
                                  //           });
                                  //         },
                                  //         child: Center(
                                  //           child: Icon(
                                  //             Icons.more_horiz,
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //       )
                                  //     :
                                  //  _phdProvider
                                  //             .mainImgFile[_phdProvider.tabIndex]
                                  //             .length >
                                  //         Index - 1
                                  //     // roomDetailImg[index].length >
                                  //     //         Index
                                  //     ?
                                  Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      // height: 60,
                                      // width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            _phdProvider.mainImgFile[
                                                    _phdProvider.tabIndex]
                                                [Index - 1],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -7,
                                      right: -7,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _phdProvider.mainImgFile[
                                                    _phdProvider.tabIndex]
                                                .removeAt(Index - 1);
                                            _phdProvider.mainImgList[
                                                    _phdProvider.tabIndex]
                                                .removeAt(Index - 1);
                                          });
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              // : GestureDetector(
                              //     onTap: () {
                              //       setState(() {
                              //         _phdProvider.moresecond = false;
                              //       });
                              //     },
                              //     child: Center(
                              //       child: Icon(
                              //         Icons.cancel,
                              //         color: Colors.grey,
                              //       ),
                              //     ),
                              //   );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.2, crossAxisCount: 5),
                          ),
                          // imgFile == null ||
                          //         imgFile.toString() == File('').toString()
                          //     ? SizedBox()
                          //     : ListView.separated(
                          //         separatorBuilder: (context, subIndex) {
                          //           return SizedBox(
                          //             height: 10,
                          //           );
                          //         },
                          //         shrinkWrap: true,
                          //         physics: NeverScrollableScrollPhysics(),
                          //         itemCount: imgFile.length,
                          //         itemBuilder:
                          //             (BuildContext context, int Index) {
                          //           return imgFile[Index] == File('')
                          //               ? SizedBox()
                          //               : ListTile(
                          //                   leading: Container(
                          //                     height: 60,
                          //                     width: 60,
                          //                     decoration: BoxDecoration(
                          //                       borderRadius:
                          //                           BorderRadius.circular(10),
                          //                       image: DecorationImage(
                          //                         fit: BoxFit.cover,
                          //                         image: FileImage(
                          //                           imgFile[Index],
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   trailing: IconButton(
                          //                       onPressed: () {
                          //                         setState(() {
                          //                           imgFile.removeAt(Index);
                          //                         });
                          //                       },
                          //                       icon: Icon(
                          //                         Icons.cancel,
                          //                         size: 20,
                          //                       )),
                          //                 );
                          //         },
                          //       ),

                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 60,
                            width: size.width,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: size.width * 0.1 - 16,
                                );
                              },
                              padding: EdgeInsets.all(8),
                              scrollDirection: Axis.horizontal,
                              itemCount: _reltorProvider
                                  .roomTypes[_phdProvider.tabIndex].length,
                              itemBuilder: (context, index) {
                                // log("snkdcksdkljdf === ${_phdProvider.selectRoomTypeFeature[_phdProvider.tabIndex]}");
                                return Container(
                                  width: size.width * 0.45 - 16,
                                  // margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: blackColor)),
                                  child: Center(
                                    child: DropdownButton<AddValueData>(
                                      borderRadius: BorderRadius.zero,
                                      underline: Container(),
                                      hint: SizedBox(
                                        width: size.width * 0.3 - 16,
                                        child: Text(
                                          // _phdProvider.selectRoomTypeFeature
                                          //                 .length ==
                                          //             0 ||
                                          _phdProvider.selectRoomTypeFeature[
                                                          _phdProvider.tabIndex]
                                                      [index] ==
                                                  null
                                              ? _reltorProvider
                                                  .roomTypes[_phdProvider
                                                      .tabIndex][index]
                                                  .type!
                                                  .name!
                                              : _phdProvider
                                                  .selectRoomTypeFeature[
                                                      _phdProvider.tabIndex]
                                                      [index]!
                                                  .name!,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              TextStyle(color: darkTextColor),
                                        ),
                                      ),
                                      items: _reltorProvider
                                          .roomTypes[_phdProvider.tabIndex]
                                              [index]
                                          .type!
                                          .featureOptions!
                                          .map((value) {
                                        return DropdownMenuItem<AddValueData>(
                                          value: value,
                                          child: Text(value.name.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        _phdProvider.selectRoomType(
                                            value!, index);
                                        setState(() {});
                                        log(_phdProvider.selectRoomTypeFeature[
                                                _phdProvider.tabIndex]
                                            .toString());
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [],
                          ),
                          Text(
                              "3. Provide room-specific details [ADD NOTES AND PHOTOS ON THE NEXT PAGE]"),
                          SizedBox(
                            height: 10,
                          ),
                          // Expanded(
                          //   child: Row(
                          //     children: [
                          //       Container(
                          //         width: 200,
                          //         height: 50,
                          //         child: CheckboxListTile(
                          //           dense: true,
                          //           controlAffinity:
                          //               ListTileControlAffinity.leading,
                          //           // value: select[index].contains(subindex),
                          //           value: Fireplace,
                          //           activeColor: AppTheme.colorPrimary,
                          //           onChanged: (val) {
                          //             log(val.toString());
                          //             setState(() {
                          //               Fireplace = val!;
                          //             });
                          //           },
                          //           title: Text("Fireplace"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 60,
                            // width: size.width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 15,
                              ),
                              itemCount: _reltorProvider
                                  .addValueData[_phdProvider.tabIndex].length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      activeColor: AppTheme.colorPrimary,
                                      value: _phdProvider.selectedaddValueData[
                                          _phdProvider.tabIndex][index],
                                      onChanged: (value) {
                                        _phdProvider.SelectAddValueData(
                                            value!, index);
                                        setState(() {});
                                      },
                                    ),
                                    Text(
                                      "${_reltorProvider.addValueData[_phdProvider.tabIndex][index].name}",
                                      style: TextStyle(color: darkTextColor),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             _phdProvider.Fireplace =
                          //                 !_phdProvider.Fireplace;
                          //           });
                          //         },
                          //         child: Row(
                          //           children: [
                          //             Checkbox(
                          //               activeColor: AppTheme.colorPrimary,
                          //               value: _phdProvider.Fireplace,
                          //               onChanged: (value) {
                          //                 setState(() {
                          //                   _phdProvider.Fireplace = value!;
                          //                 });
                          //               },
                          //             ),
                          //             Text("Fireplace"),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             _phdProvider.Upgraded_Appliances =
                          //                 !_phdProvider.Upgraded_Appliances;
                          //           });
                          //         },
                          //         child: Row(
                          //           children: [
                          //             Checkbox(
                          //               activeColor: AppTheme.colorPrimary,
                          //               value: _phdProvider.Upgraded_Appliances,
                          //               onChanged: (value) {
                          //                 setState(() {
                          //                   _phdProvider.Upgraded_Appliances = value!;
                          //                 });
                          //               },
                          //             ),
                          //             Text("Upgraded Flooring"),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             _phdProvider.Custom_Cabinetry =
                          //                 !_phdProvider.Custom_Cabinetry;
                          //           });
                          //         },
                          //         child: Row(
                          //           children: [
                          //             Checkbox(
                          //               activeColor: AppTheme.colorPrimary,
                          //               value: _phdProvider.Custom_Cabinetry,
                          //               onChanged: (value) {
                          //                 setState(() {
                          //                   _phdProvider.Custom_Cabinetry = value!;
                          //                 });
                          //               },
                          //             ),
                          //             Text("Built-in Bar/kitchen"),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          Row(
                            children: [
                              Text("Overall first impressions"),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _phdProvider.fristImpressionList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Radio(
                                    activeColor: primaryColor,
                                    value:
                                        _phdProvider.fristImpressionList[index],
                                    groupValue: _phdProvider.fristImpression,
                                    onChanged: (String? value) {
                                      _phdProvider.fristImpression = value!;
                                      _phdProvider.selectedFristImpressionList[
                                          _phdProvider.tabIndex] = value;
                                      setState(() {});
                                    },
                                  ),
                                  Text(
                                    _phdProvider.fristImpressionList[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: darkTextColor),
                                  )
                                ],
                              );
                            },
                          ),

                          // ListView.separated(
                          //   shrinkWrap: true,
                          //   physics: NeverScrollableScrollPhysics(),
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         // CatagoryExample(
                          //         //     roomFeature:
                          //         //         _roomsfeature.listOfFeature[index],
                          //         //     index: index,
                          //         //     listOfFeature:
                          //         //         _roomsfeature.listOfFeature,

                          //         //     select: select),
                          //         Row(
                          //           children: [
                          //             Checkbox(
                          //                 activeColor: AppTheme.colorPrimary,
                          //                 value: _phdProvider
                          //                     .selectedbox[_phdProvider.tabIndex]
                          //                     .contains(index),
                          //                 onChanged: (val) async {
                          //                   if (_phdProvider
                          //                       .selectedbox[_phdProvider.tabIndex]
                          //                       .contains(index)) {
                          //                     _phdProvider
                          //                         .selectedbox[_phdProvider.tabIndex]
                          //                         .remove(index);
                          //                     _phdProvider
                          //                         .select[_phdProvider.tabIndex]
                          //                             [index]
                          //                         .clear();
                          //                     _phdProvider.featureId[
                          //                         _phdProvider.tabIndex][index] = 0;
                          //                     // FeatureissueName[index].clear();
                          //                     // FeatureissueId[index].clear();
                          //                     setState(() {});
                          //                   } else {
                          //                     // setState(() {
                          //                     //   _phdProvider.DataLoding[
                          //                     //           _phdProvider.tabIndex]
                          //                     //       [index] = true;
                          //                     // });
                          //                     setState(() {
                          //                       _phdProvider.selectedbox[
                          //                               _phdProvider.tabIndex]
                          //                           .add(index);
                          //                       _phdProvider. [_phdProvider
                          //                               .tabIndex][index] =
                          //                           _roomsfeature
                          //                               .listOfFeature[index].id;
                          //                     });

                          //                     await context
                          //                         .read(customernotifier)
                          //                         .getfeatureissue(_phdProvider
                          //                                 .featureId[
                          //                             _phdProvider.tabIndex][index]);
                          //                     // setState(() {
                          //                     //   _phdProvider.DataLoding[
                          //                     //           _phdProvider.tabIndex]
                          //                     //       [index] = false;
                          //                     // });
                          //                     for (int i = 0;
                          //                         i <
                          //                             _roomsfeature
                          //                                 .listOfissues.length;
                          //                         i++) {
                          //                       _phdProvider
                          //                           .select[_phdProvider.tabIndex]
                          //                               [index]
                          //                           .add(false);
                          //                       // FeatureissueName[index].add(
                          //                       //     _roomsfeature
                          //                       //         .listOfissues[i].name);

                          //                       // FeatureissueId[index].add(
                          //                       //     _roomsfeature
                          //                       //         .listOfissues[i].id);
                          //                       // featureissueId[index].add(
                          //                       //     _roomsfeature
                          //                       //         .listOfissues[i].id);
                          //                     }
                          //                     // indexs = 0;
                          //                   }
                          //                 }),
                          //             Text(
                          //               _roomsfeature.listOfFeature[index].name,
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .bodyText1!
                          //                   .copyWith(
                          //                     fontWeight: FontWeight.w600,
                          //                     fontSize: 16,
                          //                     color: AppTheme.darkerText,
                          //                   ),
                          //             ),
                          //             Spacer(),
                          //             // selectedbox.contains(index)
                          //             //     ? IconButton(
                          //             //         onPressed: () {
                          //             //           showOptionsDialog(
                          //             //               context, 1, index);
                          //             //         },
                          //             //         icon: Icon(
                          //             //           Icons.add_box,
                          //             //           color: AppTheme.colorPrimary
                          //             //               .withOpacity(0.6),
                          //             //         ))
                          //             //     : SizedBox()
                          //           ],
                          //         ),
                          //         _phdProvider.selectedbox[_phdProvider.tabIndex]
                          //                 .contains(index)
                          //             ? GridView.builder(
                          //                 shrinkWrap: true,
                          //                 physics: NeverScrollableScrollPhysics(),
                          //                 itemCount: _phdProvider.more
                          //                     ? _phdProvider
                          //                             .roomDetailImg[_phdProvider
                          //                                 .tabIndex][index]
                          //                             .length +
                          //                         2
                          //                     : _phdProvider
                          //                                 .roomDetailImg[_phdProvider
                          //                                     .tabIndex][index]
                          //                                 .length >=
                          //                             10
                          //                         ? 11
                          //                         : _phdProvider
                          //                                 .roomDetailImg[_phdProvider
                          //                                     .tabIndex][index]
                          //                                 .length +
                          //                             1,
                          //                 gridDelegate:
                          //                     SliverGridDelegateWithFixedCrossAxisCount(
                          //                         crossAxisCount: 4,
                          //                         crossAxisSpacing: 4.0,
                          //                         mainAxisSpacing: 4.0),
                          //                 itemBuilder: (context, subIndex) {
                          //                   if (subIndex == 0) {
                          //                     return Container(
                          //                       decoration: BoxDecoration(
                          //                         border:
                          //                             Border.all(color: Colors.black),
                          //                         borderRadius:
                          //                             BorderRadius.circular(10),
                          //                       ),
                          //                       child: IconButton(
                          //                           onPressed: () {
                          //                             showOptionsDialog(
                          //                                 context, 1, index);
                          //                           },
                          //                           icon: Icon(Icons.add_a_photo)),
                          //                     );
                          //                   }
                          //                   return subIndex >= 9 &&
                          //                           _phdProvider.more == false
                          //                       ? GestureDetector(
                          //                           onTap: () {
                          //                             setState(() {
                          //                               _phdProvider.more = true;
                          //                             });
                          //                           },
                          //                           child: Center(
                          //                             child: Icon(
                          //                               Icons.more_horiz,
                          //                               color: Colors.black,
                          //                             ),
                          //                           ),
                          //                         )
                          //                       : _phdProvider
                          //                                   .roomDetailImg[
                          //                                       _phdProvider.tabIndex]
                          //                                       [index]
                          //                                   .length >
                          //                               subIndex - 1
                          //                           // roomDetailImg[index].length >
                          //                           //         Index
                          //                           ? Container(
                          //                               decoration: BoxDecoration(
                          //                                   border: Border.all(
                          //                                       color: Colors.black),
                          //                                   borderRadius:
                          //                                       BorderRadius.circular(
                          //                                           10)),
                          //                               child: Stack(
                          //                                 clipBehavior: Clip.none,
                          //                                 children: [
                          //                                   Container(
                          //                                     // height: 60,
                          //                                     // width: 60,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(10),
                          //                                       image:
                          //                                           DecorationImage(
                          //                                         fit: BoxFit.cover,
                          //                                         image: FileImage(
                          //                                           _phdProvider.roomDetailImg[
                          //                                                   _phdProvider
                          //                                                       .tabIndex][index]
                          //                                               [
                          //                                               subIndex - 1],
                          //                                         ),
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                   Positioned(
                          //                                     top: 0,
                          //                                     right: 0,
                          //                                     child: GestureDetector(
                          //                                       onTap: () {
                          //                                         setState(() {
                          //                                           _phdProvider
                          //                                               .roomDetailImg[
                          //                                                   _phdProvider
                          //                                                       .tabIndex]
                          //                                                   [index]
                          //                                               .removeAt(
                          //                                                   subIndex -
                          //                                                       1);
                          //                                         });
                          //                                       },
                          //                                       child: Icon(
                          //                                         Icons.cancel,
                          //                                         size: 25,
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                             )
                          //                           : GestureDetector(
                          //                               onTap: () {
                          //                                 setState(() {
                          //                                   _phdProvider.more = false;
                          //                                 });
                          //                               },
                          //                               child: Center(
                          //                                 child: Icon(
                          //                                   Icons.cancel,
                          //                                   color: Colors.grey,
                          //                                 ),
                          //                               ),
                          //                             );
                          //                 },
                          //               )
                          //             : SizedBox(),
                          //         SizedBox(
                          //           height: _phdProvider
                          //                   .selectedbox[_phdProvider.tabIndex]
                          //                   .contains(index)
                          //               ? 10
                          //               : 0,
                          //         ),

                          //         _phdProvider.selectedbox[_phdProvider.tabIndex]
                          //                 .contains(index)
                          //             ? Container(
                          //                 height: size.height * 0.12,
                          //                 padding: EdgeInsets.only(left: 15),
                          //                 decoration: BoxDecoration(
                          //                     border: Border.all(
                          //                         color:
                          //                             AppTheme.grey.withOpacity(0.5),
                          //                         width: 2),
                          //                     borderRadius: BorderRadius.circular(10),
                          //                     color: Colors.white),
                          //                 child: Stack(
                          //                   children: [
                          //                     TextFormField(
                          //                       controller: _phdProvider
                          //                               .DescrptionController2[
                          //                           _phdProvider.tabIndex][index],
                          //                       minLines: 2,
                          //                       maxLines: 100,
                          //                       textInputAction: TextInputAction.done,
                          //                       cursorColor: AppTheme.colorPrimary,
                          //                       decoration: InputDecoration(
                          //                           hintText:
                          //                               "Add note to inspection report",
                          //                           hintStyle: Theme.of(context)
                          //                               .textTheme
                          //                               .bodyText1,
                          //                           focusedBorder:
                          //                               UnderlineInputBorder(
                          //                                   borderSide: BorderSide(
                          //                                       color: Colors
                          //                                           .transparent)),
                          //                           enabledBorder:
                          //                               UnderlineInputBorder(
                          //                                   borderSide: BorderSide(
                          //                                       color: Colors
                          //                                           .transparent)),
                          //                           border: UnderlineInputBorder(
                          //                               borderSide: BorderSide(
                          //                                   color:
                          //                                       Colors.transparent))),
                          //                     ),
                          //                     // Align(
                          //                     //   alignment:
                          //                     //       Alignment.centerRight,
                          //                     //   child: Container(
                          //                     //     decoration: BoxDecoration(
                          //                     //       color:
                          //                     //           AppTheme.colorPrimary,
                          //                     //       borderRadius:
                          //                     //           BorderRadius.only(
                          //                     //         bottomLeft:
                          //                     //             Radius.circular(10),
                          //                     //         topLeft:
                          //                     //             Radius.circular(10),
                          //                     //       ),
                          //                     //     ),
                          //                     //     child: IconButton(
                          //                     //       icon: Icon(
                          //                     //         Icons.arrow_forward_ios,
                          //                     //         color: Colors.white,
                          //                     //       ),
                          //                     //       onPressed: () {
                          //                     //         _DescrptionController2[_phdProvider.tabIndex][
                          //                     //                     index]
                          //                     //                 .text
                          //                     //                 .isEmpty
                          //                     //             ? ScaffoldMessenger
                          //                     //                     .of(context)
                          //                     //                 .showSnackBar(
                          //                     //                     SnackBar(
                          //                     //                 content: Text(
                          //                     //                     'Add description'),
                          //                     //               ))
                          //                     //             : _description2[
                          //                     //                     index] =
                          //                     //                 _DescrptionController2[
                          //                     //                         index]
                          //                     //                     .text;
                          //                     //         _DescrptionController2[
                          //                     //                 index]
                          //                     //             .clear();
                          //                     //       },
                          //                     //     ),
                          //                     //     width: 50,
                          //                     //   ),
                          //                     // )
                          //                   ],
                          //                 ),
                          //               )
                          //             : SizedBox(),

                          //         // selectedbox.contains(index)
                          //         //     ? Column(children: [
                          //         //         DataLoding[index] == true
                          //         //             ? Column(
                          //         //                 children: [
                          //         //                   SizedBox(
                          //         //                     height: 5,
                          //         //                   ),
                          //         //                   Padding(
                          //         //                     padding: EdgeInsets.only(
                          //         //                         left: 15, right: 15),
                          //         //                     child: LinearProgressIndicator(
                          //         //                         backgroundColor:
                          //         //                             AppTheme
                          //         //                                 .colorPrimary
                          //         //                                 .withOpacity(
                          //         //                                     0.2),
                          //         //                         valueColor:
                          //         //                             AlwaysStoppedAnimation<
                          //         //                                     Color>(
                          //         //                                 AppTheme
                          //         //                                     .colorPrimary
                          //         //                                     .withOpacity(
                          //         //                                         0.5))),
                          //         //                   ),
                          //         //                   SizedBox(
                          //         //                     height: 5,
                          //         //                   ),
                          //         //                 ],
                          //         //               )
                          //         //             : Column(
                          //         //                 children: [
                          //         //                   Padding(
                          //         //                     padding: EdgeInsets.only(
                          //         //                         left: 15, right: 15),
                          //         //                     child: Align(
                          //         //                       alignment: Alignment
                          //         //                           .centerLeft,
                          //         //                       child: Wrap(
                          //         //                           // crossAxisAlignment:
                          //         //                           //     CrossAxisAlignment
                          //         //                           //         .start,
                          //         //                           // mainAxisAlignment:
                          //         //                           //     // currentoptionselected[
                          //         //                           //     //             index] !=
                          //         //                           //     //         ''
                          //         //                           //     //     ? MainAxisAlignment
                          //         //                           //     //         .spaceAround
                          //         //                           //     //     :
                          //         //                           //     MainAxisAlignment
                          //         //                           //         .start,
                          //         //                           children: [
                          //         //                             for (int i = 0;
                          //         //                                 i <
                          //         //                                     FeatureissueName[
                          //         //                                             index]
                          //         //                                         .length;
                          //         //                                 i++)
                          //         //                               Padding(
                          //         //                                 padding: const EdgeInsets
                          //         //                                         .symmetric(
                          //         //                                     horizontal:
                          //         //                                         4.0),
                          //         //                                 child: ChoiceChip(
                          //         //                                     selectedColor: AppTheme.colorPrimary,
                          //         //                                     label: Text(
                          //         //                                       FeatureissueName[index][i]
                          //         //                                           .toString(),
                          //         //                                       style: TextStyle(
                          //         //                                           color: select[index][i] == true
                          //         //                                               ? Colors.white
                          //         //                                               : Colors.black),
                          //         //                                     ),
                          //         //                                     onSelected: (value) {
                          //         //                                       setState(
                          //         //                                           () {
                          //         //                                         select[index][i] =
                          //         //                                             value;
                          //         //                                       });
                          //         //                                       setState(
                          //         //                                           () {
                          //         //                                         if (selectedCheckbox.contains(select[index]
                          //         //                                             [
                          //         //                                             i])) {
                          //         //                                           selectedCheckbox.remove(select[index][i]);
                          //         //                                         } else {
                          //         //                                           selectedCheckbox.add(select[index][i]);
                          //         //                                         }
                          //         //                                         if (select[index][i] ==
                          //         //                                             true) {
                          //         //                                           FeatureissueId[index].add(featureissueId[index][i]);
                          //         //                                           setState(() {});
                          //         //                                         } else {
                          //         //                                           FeatureissueId[index].remove(featureissueId[index][i]);
                          //         //                                           setState(() {});
                          //         //                                         }
                          //         //                                       });
                          //         //                                     },
                          //         //                                     selected: select[index][i]),
                          //         //                               ),
                          //         //                           ]),
                          //         //                     ),
                          //         //                   ),
                          //         //                   // GestureDetector(
                          //         //                   //   onTap: () {
                          //         //                   //     showOptionsDialog(
                          //         //                   //         context, 1);
                          //         //                   //   },
                          //         //                   //   child: Row(
                          //         //                   //     children: [
                          //         //                   //       Container(
                          //         //                   //         width: size.width *
                          //         //                   //             0.83,
                          //         //                   //         padding:
                          //         //                   //             EdgeInsets.only(
                          //         //                   //                 top: 7,
                          //         //                   //                 bottom: 7,
                          //         //                   //                 left: 12,
                          //         //                   //                 right: 12),
                          //         //                   //         decoration: BoxDecoration(
                          //         //                   //             color: AppTheme
                          //         //                   //                 .colorPrimary
                          //         //                   //                 .withOpacity(
                          //         //                   //                     0.4),
                          //         //                   //             borderRadius:
                          //         //                   //                 BorderRadius
                          //         //                   //                     .circular(
                          //         //                   //                         15)),
                          //         //                   //         child: Center(
                          //         //                   //           child: Text(
                          //         //                   //               'Add Photos'),
                          //         //                   //         ),
                          //         //                   //       ),
                          //         //                   //       SizedBox(
                          //         //                   //         width: 10,
                          //         //                   //       ),
                          //         //                   //       CircleAvatar(
                          //         //                   //         radius: 18,
                          //         //                   //         backgroundColor:
                          //         //                   //             AppTheme
                          //         //                   //                 .colorPrimary
                          //         //                   //                 .withOpacity(
                          //         //                   //                     0.6),
                          //         //                   //         child: IconButton(
                          //         //                   //           onPressed: () {
                          //         //                   //             if (imgGalleryRoom !=
                          //         //                   //                 null) {
                          //         //                   //               textphotoRoom(
                          //         //                   //                   index);
                          //         //                   //             }
                          //         //                   //             if (imgCameraRoom !=
                          //         //                   //                 null) {
                          //         //                   //               photocameraRoom(
                          //         //                   //                   index);
                          //         //                   //             }
                          //         //                   //           },
                          //         //                   //           icon: Icon(
                          //         //                   //             Icons.send,
                          //         //                   //             color: Colors
                          //         //                   //                 .white,
                          //         //                   //             size: 18,
                          //         //                   //           ),
                          //         //                   //         ),
                          //         //                   //       )
                          //         //                   //     ],
                          //         //                   //   ),

                          //         //                   //   //             Expanded(
                          //         //                   //   //               // width: 160,
                          //         //                   //   //               // height: 180,
                          //         //                   //   //               child:

                          //         //                   //   //               //     GridView.builder(
                          //         //                   //   //               //   physics:
                          //         //                   //   //               //       NeverScrollableScrollPhysics(),
                          //         //                   //   //               //   shrinkWrap: true,
                          //         //                   //   //               //   itemCount:
                          //         //                   //   //               //       FeatureissueName[
                          //         //                   //   //               //               index]
                          //         //                   //   //               //           .length,
                          //         //                   //   //               //   // FeatureissueName[
                          //         //                   //   //               //   //         index]
                          //         //                   //   //               //   //     .length,
                          //         //                   //   //               //   itemBuilder:
                          //         //                   //   //               //       (BuildContext
                          //         //                   //   //               //               context,
                          //         //                   //   //               //           int subindex) {
                          //         //                   //   //               //     return ChoiceChip(
                          //         //                   //   //               //         selectedColor:
                          //         //                   //   //               //             AppTheme
                          //         //                   //   //               //                 .colorPrimary,
                          //         //                   //   //               //         label: Text(
                          //         //                   //   //               //           FeatureissueName[index]
                          //         //                   //   //               //                   [
                          //         //                   //   //               //                   subindex]
                          //         //                   //   //               //               .toString(),
                          //         //                   //   //               //           style: TextStyle(
                          //         //                   //   //               //               color: select[index][subindex] ==
                          //         //                   //   //               //                       true
                          //         //                   //   //               //                   ? Colors.white
                          //         //                   //   //               //                   : Colors.black),
                          //         //                   //   //               //         ),
                          //         //                   //   //               //         onSelected:
                          //         //                   //   //               //             (value) {
                          //         //                   //   //               //           setState(
                          //         //                   //   //               //               () {
                          //         //                   //   //               //             select[index]
                          //         //                   //   //               //                     [
                          //         //                   //   //               //                     subindex] =
                          //         //                   //   //               //                 value!;
                          //         //                   //   //               //           });
                          //         //                   //   //               //           setState(
                          //         //                   //   //               //               () {
                          //         //                   //   //               //             if (selectedCheckbox.contains(
                          //         //                   //   //               //                 select[index]
                          //         //                   //   //               //                     [
                          //         //                   //   //               //                     subindex])) {
                          //         //                   //   //               //               selectedCheckbox.remove(select[index]
                          //         //                   //   //               //                   [
                          //         //                   //   //               //                   subindex]);
                          //         //                   //   //               //             } else {
                          //         //                   //   //               //               selectedCheckbox.add(select[index]
                          //         //                   //   //               //                   [
                          //         //                   //   //               //                   subindex]);
                          //         //                   //   //               //             }
                          //         //                   //   //               //             if (select[index]
                          //         //                   //   //               //                     [
                          //         //                   //   //               //                     subindex] ==
                          //         //                   //   //               //                 true) {
                          //         //                   //   //               //               FeatureissueId[index].add(featureissueId[index]
                          //         //                   //   //               //                   [
                          //         //                   //   //               //                   subindex]);
                          //         //                   //   //               //               setState(
                          //         //                   //   //               //                   () {});
                          //         //                   //   //               //             } else {
                          //         //                   //   //               //               FeatureissueId[index].remove(featureissueId[index]
                          //         //                   //   //               //                   [
                          //         //                   //   //               //                   subindex]);
                          //         //                   //   //               //               setState(
                          //         //                   //   //               //                   () {});
                          //         //                   //   //               //             }
                          //         //                   //   //               //           });
                          //         //                   //   //               //         },
                          //         //                   //   //               //         selected: select[
                          //         //                   //   //               //                 index]
                          //         //                   //   //               //             [
                          //         //                   //   //               //             subindex]);
                          //         //                   //   //               //     //  CheckboxListTile(
                          //         //                   //   //               //     //   title: Text(FeatureissueName[
                          //         //                   //   //               //     //               index]
                          //         //                   //   //               //     //           [
                          //         //                   //   //               //     //           subindex]
                          //         //                   //   //               //     //       .toString()),
                          //         //                   //   //               //     //   contentPadding:
                          //         //                   //   //               //     //       EdgeInsets
                          //         //                   //   //               //     //           .all(0),
                          //         //                   //   //               //     //   controlAffinity:
                          //         //                   //   //               //     //       ListTileControlAffinity
                          //         //                   //   //               //     //           .leading,
                          //         //                   //   //               //     //   activeColor:
                          //         //                   //   //               //     //       AppTheme
                          //         //                   //   //               //     //           .colorPrimary,
                          //         //                   //   //               //     //   onChanged:
                          //         //                   //   //               //     //       (bool?
                          //         //                   //   //               //     //           value) {
                          //         //                   //   //               //     //     setState(() {
                          //         //                   //   //               //     //       select[index]
                          //         //                   //   //               //     //               [
                          //         //                   //   //               //     //               subindex] =
                          //         //                   //   //               //     //           value!;
                          //         //                   //   //               //     //     });
                          //         //                   //   //               //     //     setState(() {
                          //         //                   //   //               //     //       if (selectedCheckbox.contains(
                          //         //                   //   //               //     //           select[index]
                          //         //                   //   //               //     //               [
                          //         //                   //   //               //     //               subindex])) {
                          //         //                   //   //               //     //         selectedCheckbox.remove(
                          //         //                   //   //               //     //             select[index]
                          //         //                   //   //               //     //                 [
                          //         //                   //   //               //     //                 subindex]);
                          //         //                   //   //               //     //       } else {
                          //         //                   //   //               //     //         selectedCheckbox.add(
                          //         //                   //   //               //     //             select[index]
                          //         //                   //   //               //     //                 [
                          //         //                   //   //               //     //                 subindex]);
                          //         //                   //   //               //     //       }
                          //         //                   //   //               //     //       if (select[index]
                          //         //                   //   //               //     //               [
                          //         //                   //   //               //     //               subindex] ==
                          //         //                   //   //               //     //           true) {
                          //         //                   //   //               //     //         FeatureissueId[
                          //         //                   //   //               //     //                 index]
                          //         //                   //   //               //     //             .add(featureissueId[index]
                          //         //                   //   //               //     //                 [
                          //         //                   //   //               //     //                 subindex]);
                          //         //                   //   //               //     //         setState(
                          //         //                   //   //               //     //             () {});
                          //         //                   //   //               //     //       } else {
                          //         //                   //   //               //     //         FeatureissueId[
                          //         //                   //   //               //     //                 index]
                          //         //                   //   //               //     //             .remove(featureissueId[index]
                          //         //                   //   //               //     //                 [
                          //         //                   //   //               //     //                 subindex]);
                          //         //                   //   //               //     //         setState(
                          //         //                   //   //               //     //             () {});
                          //         //                   //   //               //     //       }
                          //         //                   //   //               //     //     });
                          //         //                   //   //               //     //   },
                          //         //                   //   //               //     //   value: select[
                          //         //                   //   //               //     //           index]
                          //         //                   //   //               //     //       [subindex],
                          //         //                   //   //               //     // );
                          //         //                   //   //               //   },

                          //         //                   //   //               //   gridDelegate:
                          //         //                   //   //               //       SliverGridDelegateWithFixedCrossAxisCount(
                          //         //                   //   //               //     childAspectRatio:
                          //         //                   //   //               //         3,
                          //         //                   //   //               //     crossAxisCount: 3,
                          //         //                   //   //               //   ),
                          //         //                   //   //               // ),

                          //         //                   //   //             )
                          //         //                   //   //           ],
                          //         //                   //   //         ),
                          //         //                   //   //       ),
                          //         //                   //   // GestureDetector(
                          //         //                   //   //   onTap: () {
                          //         //                   //   //     showOptionsDialog(context, 1);
                          //         //                   //   //   },
                          //         //                   //   //   child: Row(
                          //         //                   //   //     children: [
                          //         //                   //   //       Container(
                          //         //                   //   //         width: size.width * 0.83,
                          //         //                   //   //         padding: EdgeInsets.only(
                          //         //                   //   //             top: 7,
                          //         //                   //   //             bottom: 7,
                          //         //                   //   //             left: 12,
                          //         //                   //   //             right: 12),
                          //         //                   //   //         decoration: BoxDecoration(
                          //         //                   //   //             color: AppTheme
                          //         //                   //   //                 .colorPrimary
                          //         //                   //   //                 .withOpacity(0.4),
                          //         //                   //   //             borderRadius:
                          //         //                   //   //                 BorderRadius
                          //         //                   //   //                     .circular(15)),
                          //         //                   //   //         child: Center(
                          //         //                   //   //           child: Text('Add Photos'),
                          //         //                   //   //         ),
                          //         //                   //   //       ),
                          //         //                   //   //       SizedBox(
                          //         //                   //   //         width: 10,
                          //         //                   //   //       ),
                          //         //                   //   //       CircleAvatar(
                          //         //                   //   //         radius: 18,
                          //         //                   //   //         backgroundColor: AppTheme
                          //         //                   //   //             .colorPrimary
                          //         //                   //   //             .withOpacity(0.6),
                          //         //                   //   //         child: IconButton(
                          //         //                   //   //             onPressed: () {
                          //         //                   //   //               if (imgGalleryRoom !=
                          //         //                   //   //                   null) {
                          //         //                   //   //                 textphotoRoom(
                          //         //                   //   //                     index);
                          //         //                   //   //               }
                          //         //                   //   //               if (imgCameraRoom !=
                          //         //                   //   //                   null) {
                          //         //                   //   //                 photocameraRoom(
                          //         //                   //   //                     index);
                          //         //                   //   //               }
                          //         //                   //   //             },
                          //         //                   //   //             icon: Icon(
                          //         //                   //   //               Icons.send,
                          //         //                   //   //               color: Colors.white,
                          //         //                   //   //               size: 18,
                          //         //                   //   //             )),
                          //         //                   //   //       )
                          //         //                   //   //     ],
                          //         //                   //   //   ),
                          //         //                   //   // ),
                          //         //                   //   // SizedBox(
                          //         //                   //   //   height: 10,
                          //         //                   // ),
                          //         //                   // // // roomDetailImg[index] == null ||
                          //         //                   // roomDetailImg[index].toString() ==
                          //         //                   //         File('').toString()
                          //         //                   roomDetailImg[index].isEmpty
                          //         //                       ? SizedBox()
                          //         //                       : GridView.builder(
                          //         //                           shrinkWrap: true,
                          //         //                           physics:
                          //         //                               NeverScrollableScrollPhysics(),
                          //         //                           itemCount: more
                          //         //                               ? roomDetailImg[
                          //         //                                           index]
                          //         //                                       .length +
                          //         //                                   1
                          //         //                               : roomDetailImg[index]
                          //         //                                           .length >=
                          //         //                                       10
                          //         //                                   ? 10
                          //         //                                   : roomDetailImg[
                          //         //                                           index]
                          //         //                                       .length,
                          //         //                           itemBuilder:
                          //         //                               (BuildContext
                          //         //                                       context,
                          //         //                                   int Index) {
                          //         //                             // log("sxsjkbsjxbsakjb" +
                          //         //                             //     Index
                          //         //                             //         .toString());
                          //         //                             // log("sxsjkbsjxbsakjb====" +
                          //         //                             //     roomDetailImg[
                          //         //                             //             index]
                          //         //                             //         .length
                          //         //                             //         .toString());
                          //         //                             // log("sxsjkbsjxbsakjb--->" +
                          //         //                             //     lessindex
                          //         //                             //         .toString());
                          //         //                             return
                          //         //                                 // roomDetailImg[
                          //         //                                 //                 index]
                          //         //                                 //             [
                          //         //                                 //             Index] ==
                          //         //                                 //         File('')
                          //         //                                 //     ? SizedBox()
                          //         //                                 //     :
                          //         //                                 Index >= 9 &&
                          //         //                                         more ==
                          //         //                                             false
                          //         //                                     ? GestureDetector(
                          //         //                                         onTap:
                          //         //                                             () {
                          //         //                                           setState(() {
                          //         //                                             more = true;
                          //         //                                           });
                          //         //                                         },
                          //         //                                         child:
                          //         //                                             Center(
                          //         //                                           child:
                          //         //                                               Icon(
                          //         //                                             Icons.more_horiz,
                          //         //                                             color: Colors.black,
                          //         //                                           ),
                          //         //                                         ),
                          //         //                                       )
                          //         //                                     : roomDetailImg[index].length >
                          //         //                                             Index
                          //         //                                         // roomDetailImg[index].length >
                          //         //                                         //         Index
                          //         //                                         ? Padding(
                          //         //                                             padding: const EdgeInsets.all(6.0),
                          //         //                                             child: Stack(
                          //         //                                               clipBehavior: Clip.none,
                          //         //                                               children: [
                          //         //                                                 Container(
                          //         //                                                   // height: 60,
                          //         //                                                   // width: 60,
                          //         //                                                   decoration: BoxDecoration(
                          //         //                                                     borderRadius: BorderRadius.circular(10),
                          //         //                                                     image: DecorationImage(
                          //         //                                                       fit: BoxFit.cover,
                          //         //                                                       image: FileImage(
                          //         //                                                         roomDetailImg[index][Index],
                          //         //                                                       ),
                          //         //                                                     ),
                          //         //                                                   ),
                          //         //                                                 ),
                          //         //                                                 Positioned(
                          //         //                                                   top: -7,
                          //         //                                                   right: -7,
                          //         //                                                   child: GestureDetector(
                          //         //                                                     onTap: () {
                          //         //                                                       setState(() {
                          //         //                                                         roomDetailImg[index].removeAt(Index);
                          //         //                                                       });
                          //         //                                                     },
                          //         //                                                     child: Icon(
                          //         //                                                       Icons.cancel,
                          //         //                                                       size: 20,
                          //         //                                                     ),
                          //         //                                                   ),
                          //         //                                                 ),
                          //         //                                               ],
                          //         //                                             ),
                          //         //                                           )
                          //         //                                         : GestureDetector(
                          //         //                                             onTap: () {
                          //         //                                               setState(() {
                          //         //                                                 more = false;
                          //         //                                               });
                          //         //                                             },
                          //         //                                             child: Center(
                          //         //                                               child: Icon(
                          //         //                                                 Icons.cancel,
                          //         //                                                 color: Colors.grey,
                          //         //                                               ),
                          //         //                                             ),
                          //         //                                           );
                          //         //                           },
                          //         //                           gridDelegate:
                          //         //                               SliverGridDelegateWithFixedCrossAxisCount(
                          //         //                                   childAspectRatio:
                          //         //                                       1.2,
                          //         //                                   crossAxisCount:
                          //         //                                       5),
                          //         //                         ),
                          //         //                 ],
                          //         //               )
                          //         //       ])
                          //         //     : Container(),

                          //         // Row(
                          //         //   mainAxisAlignment: MainAxisAlignment.start,
                          //         //   crossAxisAlignment: CrossAxisAlignment.end,
                          //         //   children: [
                          //         //     Container(
                          //         //       height: size.height * 0.22,
                          //         //       width: size.width / 2,
                          //         //       child: ListView.builder(
                          //         //           //shrinkWrap: true,
                          //         //           shrinkWrap: true,
                          //         //           physics:
                          //         //               NeverScrollableScrollPhysics(),
                          //         //           itemCount: 3,
                          //         //           itemBuilder: (context, subindex) {
                          //         //             return CheckboxListTile(
                          //         //               controlAffinity:
                          //         //                   ListTileControlAffinity
                          //         //                       .leading,
                          //         //               // value: select[index].contains(subindex),
                          //         //               value: select[index][subindex],
                          //         //               activeColor:
                          //         //                   AppTheme.colorPrimary,
                          //         //               onChanged: (val) {
                          //         //                 log(val.toString());
                          //         //                 setState(() {
                          //         //                   if (select[index]
                          //         //                           [subindex] ==
                          //         //                       true) {
                          //         //                     // select[index].remove(false);
                          //         //                     select[index][subindex] =
                          //         //                         false;
                          //         //                   } else {
                          //         //                     // select[index].add(true);
                          //         //                     select[index][subindex] =
                          //         //                         true;
                          //         //                     featureId[index] =
                          //         //                         _roomsfeature
                          //         //                             .listOfFeature[
                          //         //                                 index]
                          //         //                             .id;
                          //         //                   }
                          //         //                 });
                          //         //                 context
                          //         //                     .read(customernotifier)
                          //         //                     .getfeatureissue(
                          //         //                         featureId[index]);
                          //         //               },
                          //         //               title: Text(
                          //         //                   "${subindex == 0 ? "DAZLING" : subindex == 1 ? "MARKET READY" : "NEEDS DAZL"}"),
                          //         //             );
                          //         //           }),
                          //         //     ),
                          //         //     select[index][2] == true
                          //         //         ? Container(
                          //         //             width: size.width * 0.4,
                          //         //             margin:
                          //         //                 EdgeInsets.only(bottom: 10),
                          //         //             child: DropdownButton(
                          //         //                 isExpanded: true,
                          //         //                 borderRadius:
                          //         //                     BorderRadius.circular(20),
                          //         //                 // hint: currentoptionselected[
                          //         //                 //             index] ==
                          //         //                 //         ''
                          //         //                 //     ? Text('Select Option')
                          //         //                 //     : Text(
                          //         //                 //         currentoptionselected[
                          //         //                 //             index]),
                          //         //                 items: _roomsfeature
                          //         //                     .listOfissues
                          //         //                     .where((c) =>
                          //         //                         c.featureId ==
                          //         //                         featureId[index])
                          //         //                     .map((dropdownselect) {
                          //         //                   return DropdownMenuItem<
                          //         //                       String>(
                          //         //                     child: Text(
                          //         //                         dropdownselect.name),
                          //         //                     value:
                          //         //                         dropdownselect.name,
                          //         //                     // onTap: () {
                          //         //                     //   currenoptionselectedid[
                          //         //                     //           index] =
                          //         //                     //       dropdownselect.id;
                          //         //                     // },
                          //         //                   );
                          //         //                 }).toList(),
                          //         //                 onChanged: (val) {}),
                          //         //           )
                          //         //         : Container(),
                          //         //   ],
                          //         // ),
                          //       ],
                          //     );
                          //   },
                          //   separatorBuilder: (BuildContext context, int index) {
                          //     return SizedBox(
                          //       height: 10,
                          //     );
                          //   },
                          //   itemCount: _roomsfeature.listOfFeature.length,
                          // ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Buyer Road Blocks or Recommendations?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _roomsfeature.listOfFeature.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: AppTheme.colorPrimary,
                                          value: _phdProvider
                                              .select[_phdProvider.tabIndex]
                                              .contains(index),
                                          onChanged: (val) {
                                            setState(() {
                                              if (_phdProvider
                                                  .select[_phdProvider.tabIndex]
                                                  .contains(index)) {
                                                _phdProvider.select[
                                                        _phdProvider.tabIndex]
                                                    .remove(index);
                                                // _roomProvider. currentoptionselected[index] = '';
                                                _phdProvider.imgFile[
                                                        _phdProvider.tabIndex]
                                                        [index]
                                                    .clear();
                                                // _addphotodescription[index].clear();
                                                _phdProvider.featureId[
                                                        _phdProvider.tabIndex]
                                                    [index] = 0;
                                                // featureoptionid[index] = 0;
                                                // _phdProvider.description[
                                                //         _roomProvider.tabIndex]
                                                //     [index] = '';
                                                _phdProvider
                                                    .DescrptionController2[
                                                        _phdProvider.tabIndex]
                                                        [index]
                                                    .clear();
                                                // _PhotoDescrptionController[index]
                                                //     .clear();
                                                _phdProvider.featurebool[
                                                        _phdProvider.tabIndex]
                                                        [index]
                                                    .clear();
                                                // FeatureissueName[index].clear();
                                                // FeatureissueId[index].clear();
                                                indexs = 0;
                                                // currentindex = index;
                                              } else {
                                                _phdProvider.select[
                                                        _phdProvider.tabIndex]
                                                    .add(index);
                                                _phdProvider.featureId[
                                                        _phdProvider
                                                            .tabIndex][index] =
                                                    _roomsfeature
                                                        .listOfFeature[index]
                                                        .id;
                                                indexs = 0;
                                              }
                                            });
                                          }),
                                      Text(
                                        _roomsfeature.listOfFeature[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: AppTheme.darkerText,
                                            ),
                                      )
                                    ],
                                  ),
                                  _phdProvider.select[_phdProvider.tabIndex]
                                          .contains(index)
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          //color: Colors.amber,
                                          child: Column(
                                            children: [
                                              // Row(
                                              //   crossAxisAlignment:
                                              //       CrossAxisAlignment.start,
                                              //   mainAxisAlignment:
                                              //       currentoptionselected[index] !=
                                              //               ''
                                              //           ? MainAxisAlignment
                                              //               .spaceAround
                                              //           : MainAxisAlignment.start,
                                              //   children: [
                                              //     Container(
                                              //       width: size.width / 2.3,
                                              //       decoration: BoxDecoration(
                                              //           // color: Colors.blue,
                                              //           // borderRadius:
                                              //           //     BorderRadius.circular(20)
                                              //           ),
                                              //       child: DropdownButton<String>(
                                              //         isExpanded: true,
                                              //         borderRadius:
                                              //             BorderRadius.circular(20),
                                              //         hint: currentoptionselected[
                                              //                     index] ==
                                              //                 ''
                                              //             ? Text('Select Option')
                                              //             : Text(
                                              //                 currentoptionselected[
                                              //                     index]),
                                              //         items: _roomsfeature
                                              //             .listOfoption
                                              //             .where((c) =>
                                              //                 c.featureId ==
                                              //                 featureId[index])
                                              //             .map((dropdownselect) {
                                              //           return DropdownMenuItem<
                                              //               String>(
                                              //             child: Text(
                                              //                 dropdownselect.name),
                                              //             value:
                                              //                 dropdownselect.name,
                                              //             onTap: () {
                                              //               currenoptionselectedid[
                                              //                       index] =
                                              //                   dropdownselect.id;
                                              //             },
                                              //           );
                                              //         }).toList(),
                                              //         onChanged:
                                              //             (newselectedvalue) async {
                                              //           currentoptionselected[
                                              //                   index] =
                                              //               newselectedvalue!;
                                              //           featureoptionid[index] =
                                              //               currenoptionselectedid[
                                              //                   index];
                                              //           featurebool[index].clear();
                                              //           FeatureissueName[index]
                                              //               .clear();
                                              //           FeatureissueId[index]
                                              //               .clear();

                                              //           setState(() {
                                              //             _isLoading = true;
                                              //           });
                                              //           await context
                                              //               .read(customernotifier)
                                              //               .getfeatureissue(
                                              //                   currenoptionselectedid[
                                              //                       index]);
                                              //           setState(() {
                                              //             _isLoading = false;
                                              //           });
                                              //           for (int i = 0;
                                              //               i <
                                              //                   _roomsfeature
                                              //                       .listOfissues
                                              //                       .length;
                                              //               i++) {
                                              //             featurebool[index]
                                              //                 .add(false);
                                              //             FeatureissueName[index]
                                              //                 .add(_roomsfeature
                                              //                     .listOfissues[i]
                                              //                     .name);
                                              //             featureissueId[index].add(
                                              //                 _roomsfeature
                                              //                     .listOfissues[i]
                                              //                     .id);
                                              //           }
                                              //         },
                                              //       ),
                                              //     ),
                                              //     _isLoading
                                              //         ? CupertinoActivityIndicator(
                                              //             color: AppTheme
                                              //                 .colorPrimary
                                              //                 .withOpacity(0.5),
                                              //           )
                                              //         : currentoptionselected[
                                              //                     index] !=
                                              //                 ''
                                              //             ? Expanded(
                                              //                 // width: 160,
                                              //                 // height: 180,
                                              //                 child:
                                              //                     ListView.builder(
                                              //                   physics:
                                              //                       NeverScrollableScrollPhysics(),
                                              //                   shrinkWrap: true,
                                              //                   itemCount:
                                              //                       FeatureissueName[
                                              //                               index]
                                              //                           .length,
                                              //                   itemBuilder:
                                              //                       (BuildContext
                                              //                               context,
                                              //                           int subindex) {
                                              //                     return Padding(
                                              //                       padding:
                                              //                           const EdgeInsets
                                              //                                   .only(
                                              //                               left:
                                              //                                   20),
                                              //                       child:
                                              //                           SingleChildScrollView(
                                              //                         scrollDirection:
                                              //                             Axis.horizontal,
                                              //                         physics:
                                              //                             BouncingScrollPhysics(),
                                              //                         child: Row(
                                              //                           children: [
                                              //                             ChoiceChip(
                                              //                                 selectedColor: AppTheme
                                              //                                     .colorPrimary,
                                              //                                 label:
                                              //                                     Text(
                                              //                                   FeatureissueName[index][subindex].toString(),
                                              //                                   style:
                                              //                                       TextStyle(color: featurebool[index][subindex] == true ? Colors.white : Colors.black),
                                              //                                 ),
                                              //                                 onSelected:
                                              //                                     (value) {
                                              //                                   setState(() {
                                              //                                     featurebool[index][subindex] = value;
                                              //                                     if (selectcheckbox.contains(featurebool[index][subindex])) {
                                              //                                       selectcheckbox.remove(featurebool[index][subindex]);
                                              //                                     } else {
                                              //                                       selectcheckbox.add(featurebool[index][subindex]);
                                              //                                     }
                                              //                                     if (featurebool[index][subindex] == true) {
                                              //                                       FeatureissueId[index].add(featureissueId[index][subindex]);
                                              //                                     } else {
                                              //                                       FeatureissueId[index].remove(featureissueId[index][subindex]);
                                              //                                     }
                                              //                                     // log("sdsdw" +
                                              //                                     //     FeatureissueId
                                              //                                     //         .toString());
                                              //                                     // log("sdsdw" +
                                              //                                     //     featurebool
                                              //                                     //         .toString());
                                              //                                   });
                                              //                                 },
                                              //                                 selected:
                                              //                                     featurebool[index][subindex]),
                                              //                           ],
                                              //                         ),
                                              //                       ),
                                              //                     );
                                              //                     // return CheckboxListTile(
                                              //                     //   title: Text(
                                              //                     //       FeatureissueName[
                                              //                     //                   index]
                                              //                     //               [
                                              //                     //               subindex]
                                              //                     //           .toString()),
                                              //                     //   contentPadding:
                                              //                     //       EdgeInsets.all(
                                              //                     //           0),
                                              //                     //   controlAffinity:
                                              //                     //       ListTileControlAffinity
                                              //                     //           .leading,
                                              //                     //   activeColor: AppTheme
                                              //                     //       .colorPrimary,
                                              //                     //   onChanged:
                                              //                     //       (bool? value) {
                                              //                     //     setState(() {
                                              //                     //       featurebool[index]
                                              //                     //               [
                                              //                     //               subindex] =
                                              //                     //           value!;
                                              //                     //       if (selectcheckbox.contains(
                                              //                     //           featurebool[
                                              //                     //                   index]
                                              //                     //               [
                                              //                     //               subindex])) {
                                              //                     //         selectcheckbox.remove(
                                              //                     //             featurebool[
                                              //                     //                     index]
                                              //                     //                 [
                                              //                     //                 subindex]);
                                              //                     //       } else {
                                              //                     //         selectcheckbox.add(
                                              //                     //             featurebool[
                                              //                     //                     index]
                                              //                     //                 [
                                              //                     //                 subindex]);
                                              //                     //       }
                                              //                     //       if (featurebool[
                                              //                     //                   index]
                                              //                     //               [
                                              //                     //               subindex] ==
                                              //                     //           true) {
                                              //                     //         FeatureissueId[
                                              //                     //                 index]
                                              //                     //             .add(featureissueId[
                                              //                     //                     index]
                                              //                     //                 [
                                              //                     //                 subindex]);
                                              //                     //       } else {
                                              //                     //         FeatureissueId[
                                              //                     //                 index]
                                              //                     //             .remove(featureissueId[
                                              //                     //                     index]
                                              //                     //                 [
                                              //                     //                 subindex]);
                                              //                     //       }
                                              //                     //       // log("sdsdw" +
                                              //                     //       //     FeatureissueId
                                              //                     //       //         .toString());
                                              //                     //       // log("sdsdw" +
                                              //                     //       //     featurebool
                                              //                     //       //         .toString());
                                              //                     //     });
                                              //                     //   },
                                              //                     //   value: featurebool[
                                              //                     //           index]
                                              //                     //       [subindex],
                                              //                     // );
                                              //                   },
                                              //                 ),
                                              //               )
                                              //             : Container()
                                              //   ],
                                              // ),
                                              // SizedBox(
                                              //   height: 10,
                                              // ),

                                              // GestureDetector(
                                              //   onTap: () {
                                              //     // featureoptionid[index] == 0
                                              //     //     //  ||
                                              //     //     //         featureissueid[index] == 0
                                              //     //     ? ScaffoldMessenger.of(
                                              //     //             context)
                                              //     //         .showSnackBar(SnackBar(
                                              //     //         content: Text(
                                              //     //             'Select Option And issue'),
                                              //     //       ))
                                              //     //     :

                                              //     showOptionsDialog(context, index);
                                              //     // setState(() {});
                                              //   },
                                              //   child: Container(
                                              //     child: Row(
                                              //       children: [
                                              //         // fileImage.isNotEmpty
                                              //         //     ? Row(
                                              //         //         children: [
                                              //         //           Icon(Icons.add_box),
                                              //         //           SizedBox(
                                              //         //             width: 5,
                                              //         //           ),
                                              //         //           Container(
                                              //         //             width: 50,
                                              //         //             height: 50,
                                              //         //             child: ClipRRect(
                                              //         //               borderRadius:
                                              //         //                   BorderRadius
                                              //         //                       .circular(
                                              //         //                           5),
                                              //         //               child: Image.file(
                                              //         //                   File(fileImage
                                              //         //                       .first),
                                              //         //                   fit: BoxFit
                                              //         //                       .cover),
                                              //         //             ),
                                              //         //           )
                                              //         //         ],
                                              //         //       )
                                              //         //     :
                                              //         Container(
                                              //             padding: EdgeInsets.only(
                                              //                 top: 7,
                                              //                 bottom: 7,
                                              //                 left: 12,
                                              //                 right: 12),
                                              //             decoration: BoxDecoration(
                                              //                 color: AppTheme
                                              //                     .colorPrimary
                                              //                     .withOpacity(0.4),
                                              //                 borderRadius:
                                              //                     BorderRadius
                                              //                         .circular(
                                              //                             15)),
                                              //             child: Text('+ Photos')),
                                              //         SizedBox(width: 10),
                                              //         // Expanded(
                                              //         //   child: Container(
                                              //         //     padding: EdgeInsets.only(
                                              //         //         left: 7),
                                              //         //     height:
                                              //         //         size.height * 0.05,
                                              //         //     decoration: BoxDecoration(
                                              //         //         border: Border.all(
                                              //         //             color: AppTheme
                                              //         //                 .grey
                                              //         //                 .withOpacity(
                                              //         //                     0.5),
                                              //         //             width: 2),
                                              //         //         borderRadius:
                                              //         //             BorderRadius
                                              //         //                 .circular(15),
                                              //         //         color: Colors.white),
                                              //         //     child: TextFormField(
                                              //         //       controller:
                                              //         //           _PhotoDescrptionController[
                                              //         //               index],
                                              //         //       // textInputAction:
                                              //         //       //     TextInputAction.done,
                                              //         //       cursorColor: AppTheme
                                              //         //           .colorPrimary,
                                              //         //       decoration: InputDecoration(
                                              //         //           hintText:
                                              //         //               "Add Photo Description",
                                              //         //           hintStyle: TextStyle(
                                              //         //               fontSize: 14),
                                              //         //           focusedBorder: UnderlineInputBorder(
                                              //         //               borderSide: BorderSide(
                                              //         //                   color: Colors
                                              //         //                       .transparent)),
                                              //         //           enabledBorder: UnderlineInputBorder(
                                              //         //               borderSide: BorderSide(
                                              //         //                   color: Colors
                                              //         //                       .transparent)),
                                              //         //           border: UnderlineInputBorder(
                                              //         //               borderSide: BorderSide(
                                              //         //                   color: Colors
                                              //         //                       .transparent))),
                                              //         //     ),
                                              //         //   ),
                                              //         // ),

                                              //         // SizedBox(
                                              //         //   width: 5,
                                              //         // ),
                                              //         // CircleAvatar(
                                              //         //   radius: 18,
                                              //         //   backgroundColor: AppTheme
                                              //         //       .colorPrimary
                                              //         //       .withOpacity(0.6),
                                              //         //   child: IconButton(
                                              //         //       onPressed: () {
                                              //         //         if (imgGallery !=
                                              //         //             null) {
                                              //         //           textphoto(index);
                                              //         //           // fileImage.clear();
                                              //         //         }
                                              //         //         if (imgCamera !=
                                              //         //             null) {
                                              //         //           photocamera(index);
                                              //         //           // fileImage.clear();
                                              //         //         }
                                              //         //       },
                                              //         //       icon: Icon(
                                              //         //         Icons.send,
                                              //         //         color: Colors.white,
                                              //         //         size: 18,
                                              //         //       )),
                                              //         // )
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              _phdProvider.imgFile[_phdProvider
                                                              .tabIndex][index]
                                                          .toString() ==
                                                      File('').toString()
                                                  ? SizedBox()
                                                  : GridView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: _phdProvider
                                                              .imgFile[
                                                                  _phdProvider
                                                                      .tabIndex]
                                                                  [index]
                                                              .length +
                                                          1,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 4,
                                                              crossAxisSpacing:
                                                                  4.0,
                                                              mainAxisSpacing:
                                                                  4.0),
                                                      itemBuilder:
                                                          (context, subIndex) {
                                                        if (subIndex == 0) {
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  showOptionsDialog(
                                                                      context,
                                                                      1,
                                                                      index,
                                                                      false);
                                                                },
                                                                icon: Icon(Icons
                                                                    .add_a_photo)),
                                                          );
                                                        }
                                                        return _phdProvider.imgFile[
                                                                        _phdProvider
                                                                            .tabIndex][index]
                                                                    [subIndex -
                                                                        1] ==
                                                                File('')
                                                            //      ||
                                                            // _addphotodescription[
                                                            //             index][
                                                            //         subIndex] ==
                                                            //     ''
                                                            ? SizedBox()
                                                            : Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      // height: 60,
                                                                      // width: 60,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              FileImage(
                                                                            _phdProvider.imgFile[_phdProvider.tabIndex][index][subIndex -
                                                                                1],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                      top: -10,
                                                                      right: -5,
                                                                      child: IconButton(
                                                                          onPressed: () {
                                                                            setState(() {
                                                                              _phdProvider.imgFile[_phdProvider.tabIndex][index].removeAt(subIndex - 1);
                                                                              _phdProvider.imagesList[_phdProvider.tabIndex][index].removeAt(subIndex - 1);
                                                                              // _addphotodescription[index]
                                                                              //     .removeAt(subIndex);
                                                                            });
                                                                          },
                                                                          icon: Icon(
                                                                            Icons.cancel,
                                                                            size:
                                                                                25,
                                                                          )),
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                      },
                                                    ),

                                              // ListView.separated(
                                              //     separatorBuilder:
                                              //         (context, subIndex) {
                                              //       return SizedBox(
                                              //         height: 10,
                                              //       );
                                              //     },
                                              //     shrinkWrap: true,
                                              //     physics:
                                              //         NeverScrollableScrollPhysics(),
                                              //     itemCount:
                                              //         imgFile[index].length,
                                              //     itemBuilder:
                                              //         (BuildContext context,
                                              //             int subIndex) {
                                              //       return imgFile[index]
                                              //                   [subIndex] ==
                                              //               File('')
                                              //           //      ||
                                              //           // _addphotodescription[
                                              //           //             index][
                                              //           //         subIndex] ==
                                              //           //     ''
                                              //           ? SizedBox()
                                              //           : ListTile(
                                              //               leading: Container(
                                              //                 height: 60,
                                              //                 width: 60,
                                              //                 decoration:
                                              //                     BoxDecoration(
                                              //                   borderRadius:
                                              //                       BorderRadius
                                              //                           .circular(
                                              //                               10),
                                              //                   image:
                                              //                       DecorationImage(
                                              //                     fit: BoxFit
                                              //                         .cover,
                                              //                     image:
                                              //                         FileImage(
                                              //                       imgFile[index]
                                              //                           [
                                              //                           subIndex],
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //               ),
                                              //               title:
                                              //                   // _addphotodescription[
                                              //                   //             subIndex] ==
                                              //                   //         ''
                                              //                   //     ?
                                              //                   Text(''),
                                              //               // : Text(_addphotodescription[
                                              //               //         index]
                                              //               //     [subIndex]),
                                              //               trailing:
                                              //                   IconButton(
                                              //                       onPressed:
                                              //                           () {
                                              //                         setState(
                                              //                             () {
                                              //                           imgFile[index]
                                              //                               .removeAt(subIndex);
                                              //                           // _addphotodescription[index]
                                              //                           //     .removeAt(subIndex);
                                              //                         });
                                              //                       },
                                              //                       icon: Icon(
                                              //                         Icons
                                              //                             .cancel,
                                              //                         size: 20,
                                              //                       )),
                                              //             );
                                              //     },
                                              //   ),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: size.height * 0.12,
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppTheme.grey
                                                            .withOpacity(0.5),
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                child: Stack(
                                                  children: [
                                                    TextFormField(
                                                      controller: _phdProvider
                                                              .DescrptionController2[
                                                          _phdProvider
                                                              .tabIndex][index],
                                                      minLines: 2,
                                                      maxLines: 100,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      cursorColor:
                                                          AppTheme.colorPrimary,
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Add note to inspection report",
                                                          hintStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                          focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                          enabledBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                          border: UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent))),
                                                    ),
                                                    // Align(
                                                    //   alignment:
                                                    //       Alignment.centerRight,
                                                    //   child: Container(
                                                    //     decoration: BoxDecoration(
                                                    //       color:
                                                    //           AppTheme.colorPrimary,
                                                    //       borderRadius:
                                                    //           BorderRadius.only(
                                                    //         bottomLeft:
                                                    //             Radius.circular(10),
                                                    //         topLeft:
                                                    //             Radius.circular(10),
                                                    //       ),
                                                    //     ),
                                                    //     child: IconButton(
                                                    //       icon: Icon(
                                                    //         Icons.arrow_forward_ios,
                                                    //         color: Colors.white,
                                                    //       ),
                                                    //       onPressed: () {
                                                    //         _DescrptionController[
                                                    //                     index]
                                                    //                 .text
                                                    //                 .isEmpty
                                                    //             ? ScaffoldMessenger
                                                    //                     .of(context)
                                                    //                 .showSnackBar(
                                                    //                     SnackBar(
                                                    //                 content: Text(
                                                    //                     'Add description'),
                                                    //               ))
                                                    //             : _description[
                                                    //                     index] =
                                                    //                 _DescrptionController[
                                                    //                         index]
                                                    //                     .text;
                                                    //         _DescrptionController[
                                                    //                 index]
                                                    //             .clear();
                                                    //       },
                                                    //     ),
                                                    //     width: 50,
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   height: size.height * 0.08,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(20),
                  //         topRight: Radius.circular(20),
                  //       ),
                  //       color: AppTheme.colorPrimary),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.of(context).pop();
                  //         },
                  //         child: Row(
                  //           children: [
                  //             Icon(
                  //               Icons.arrow_back_ios,
                  //               size: 20,
                  //               color: AppTheme.white,
                  //             ),
                  //             Text(
                  //               "Previous",
                  //               style:
                  //                   Theme.of(context).textTheme.bodyText1!.copyWith(
                  //                         fontSize: 18,
                  //                         color: lightColor.withOpacity(.9),
                  //                       ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>selectRoom()));
                  //         },
                  //         child: Row(
                  //           children: [
                  //             Text(
                  //               "Finish",
                  //               style:
                  //                   Theme.of(context).textTheme.bodyText1!.copyWith(
                  //                         fontSize: 18,
                  //                         color: lightColor.withOpacity(.9),
                  //                       ),
                  //             ),
                  //             Icon(
                  //               Icons.arrow_forward_ios,
                  //               size: 20,
                  //               color: AppTheme.white,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
      ),
    );
  }

  Future<void> showOptionsDialog(
      BuildContext context, int index, int ListIndex, bool isMainImg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Select Option",
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          size: 40,
                        ),
                        Text('Camera')
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      index == 0
                          ? openCamera(isMainImg)
                          : openCameraRoom(ListIndex, isMainImg);
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo,
                          size: 40,
                        ),
                        Text('Gallery')
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      index == 0
                          ? openGallery(isMainImg)
                          : openGalleryRoom(ListIndex, isMainImg);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  late var imgCamera;
  void openCamera(bool isMainImg) async {
    imgCamera =
        await _phdProvider.imgPicker.getImage(source: ImageSource.camera);
    if (imgCamera != null) {
      photocamera(isMainImg);
    }
  }

  late List<PickedFile>? imgGallery;
  void openGallery(bool isMainImg) async {
    imgGallery = await _phdProvider.imgPicker.getMultiImage();
    if (imgGallery != null) {
      textphoto(isMainImg);
    }
  }

  Future<void> textphoto(bool isMainImg) async {
    if (imgGallery == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Add Photo'),
      ));
    } else {
      Utils.loaderDialog(context, true);
      log("kdfgkgfk === ${_phdProvider.mainImgFile[_phdProvider.tabIndex]}");
      for (int i = 0; i < imgGallery!.length; i++) {
        _phdProvider.mainImgFile[_phdProvider.tabIndex]
            .add(File(imgGallery![i].path));
        await _phdProvider.getImage(context, _phdProvider.tabIndex, 0,
            File(imgGallery![i].path), isMainImg, ref);
      }
      log("kdfgkgfk === ${_phdProvider.mainImgFile[_phdProvider.tabIndex]}");

      imgGallery = null;
    }

    Utils.loaderDialog(context, false);
    setState(() {});
  }

  Future<void> photocamera(bool isMainImg) async {
    if (imgCamera == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Add description or Photo'),
      ));
    } else {
      Utils.loaderDialog(context, true);
      _phdProvider.mainImgFile[_phdProvider.tabIndex].add(File(imgCamera.path));
      await _phdProvider.getImage(context, _phdProvider.tabIndex, 0,
          File(imgCamera.path), isMainImg, ref);
      imgCamera = null;
      Utils.loaderDialog(context, false);
    }
    setState(() {});
  }

  late var imgCameraRoom;
  void openCameraRoom(int index, bool isMainImg) async {
    imgCameraRoom =
        await _phdProvider.imgPicker.getImage(source: ImageSource.camera);
    if (imgCameraRoom != null) {
      Utils.loaderDialog(context, true);
      _phdProvider.imgFile[_phdProvider.tabIndex][index]
          .add(File(imgCameraRoom.path));
      await _phdProvider.getImage(context, _phdProvider.tabIndex, index,
          File(imgCameraRoom.path), isMainImg, ref);
      imgCameraRoom = null;
      Utils.loaderDialog(context, false);
      setState(() {});
    }
  }

  late var imgGalleryRoom;
  void openGalleryRoom(int index, bool isMainImg) async {
    imgGalleryRoom = await _phdProvider.imgPicker.getMultiImage();
    if (imgGalleryRoom != null) {
      Utils.loaderDialog(context, true);

      for (int i = 0; i < imgGalleryRoom.length; i++) {
        _phdProvider.imgFile[_phdProvider.tabIndex][index]
            .add(File(imgGalleryRoom[i].path));
        await _phdProvider.getImage(context, _phdProvider.tabIndex, index,
            File(imgGalleryRoom[i].path), isMainImg, ref);
      }
      imgGalleryRoom = null;
      Utils.loaderDialog(context, false);
      setState(() {});
    }
  }

  void textphotoRoom(int index) {
    setState(() {
      if (imgGalleryRoom == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add Photo'),
        ));
      } else {
        _phdProvider.imgFile[_phdProvider.tabIndex][index]
            .add(File(imgGalleryRoom.path));
        imgGalleryRoom = null;
      }
    });
  }

  void photocameraRoom(int index) {
    setState(() {
      if (imgCameraRoom == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add description or Photo'),
        ));
      } else {
        _phdProvider.imgFile[_phdProvider.tabIndex][index]
            .add(File(imgCameraRoom.path));
        // log(roomDetailImg.toString());
        imgCameraRoom = null;
      }
    });
  }
}

class CatagoryExample extends ConsumerStatefulWidget {
  RoomFeature roomFeature;
  int index;
  List<RoomFeature> listOfFeature;
  // late List<Featureissue> listOfissues;
  List<List<bool>> select;

  CatagoryExample(
      {Key? key,
      required this.roomFeature,
      required this.index,
      required this.listOfFeature,
      required this.select})
      : super(key: key);

  @override
  ConsumerState<CatagoryExample> createState() => _CatagoryExampleState();
}

class _CatagoryExampleState extends ConsumerState<CatagoryExample> {
  loaddata() async {
    final _roomsfeature = ref.read(customernotifier);

    await _roomsfeature.getRoomsFeature(roomid);
    await _roomsfeature.getFeatureOptionIssues();
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _roomsfeature = ref.read(customernotifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.roomFeature.name,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppTheme.darkerText,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, subindex) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      // value: select[index].contains(subindex),
                      value: widget.select[widget.index][subindex],
                      activeColor: AppTheme.colorPrimary,
                      onChanged: (val) {
                        log(val.toString());
                        setState(() {
                          if (widget.select[widget.index][subindex] == true) {
                            // select[index].remove(false);
                            widget.select[widget.index][subindex] = false;
                          } else {
                            // select[index].add(true);
                            widget.select[widget.index][subindex] = true;
                            // featureId[widget.index]=widget.listOfFeature[widget.index].id;
                          }
                        });
                        ref.read(customernotifier).getfeatureissue(
                            widget.listOfFeature[widget.index].id);
                      },
                      title: Text(
                          "${subindex == 0 ? "DAZLING" : subindex == 1 ? "MARKET READY" : "NEEDS DAZL"}"),
                    );
                  }),
            ),
            widget.select[widget.index][2] == true
                ? Container(
                    width: size.width * 0.4,
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButton(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(20),
                        // hint: currentoptionselected[
                        //             index] ==
                        //         ''
                        //     ? Text('Select Option')
                        //     : Text(
                        //         currentoptionselected[
                        //             index]),
                        // items: [
                        //   DropdownMenuItem(
                        //     child: Text("Demo DropDown ${widget.index}"),
                        //     value: "Demo DropDown ${widget.index}",
                        //   )
                        // ],
                        items: _roomsfeature.listOfissues
                            .where((c) =>
                                c.featureId ==
                                widget.listOfFeature[widget.index].id)
                            .map((dropdownselect) {
                          return DropdownMenuItem<String>(
                            child: Text(dropdownselect.name),
                            value: dropdownselect.name,
                            // onTap: () {
                            //   currenoptionselectedid[
                            //           index] =
                            //       dropdownselect.id;
                            // },
                          );
                        }).toList(),
                        onChanged: (val) {}),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
