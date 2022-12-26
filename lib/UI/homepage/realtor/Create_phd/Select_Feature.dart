// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/model/Customer/Features.dart';
import 'package:dazllapp/model/Realtor/realtor_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SelectFeature extends StatefulHookWidget {
  const SelectFeature({Key? key}) : super(key: key);

  @override
  State<SelectFeature> createState() => _SelectFeatureState();
}

class _SelectFeatureState extends State<SelectFeature> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  bool loading = true;
  bool dataLoading = false;
  bool Fireplace = false;
  bool Upgraded_Appliances = false;
  bool Custom_Cabinetry = false;
  bool DAZLING = false;
  bool MARKET_READY = false;
  bool NEEDS_DAZL = false;
  List<int> featureId = [];
  bool more = false;
  bool moresecond = false;
  loaddata() async {
    final _roomsfeature = context.read(customernotifier);

    await _roomsfeature.getRoomsFeature(roomid);
    await _roomsfeature.getFeatureOptionIssues();

    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      select.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      FeatureissueName.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      FeatureissueId.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      // select.add([]);
      roomDetailImg.add([]);
      // setState(() {
      //   loading = false;
      // });
      // log(select.toString());
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      // select.add([]);
      DataLoding.add(false);
      // setState(() {
      //   loading = false;
      // });
      // log(select.toString());
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      // select.add([]);
      featureId.add(0);
      // setState(() {
      //   loading = false;
      // });
      // log(select.toString());
    }

    setState(() {
      loading = false;
    });
  }

  TextEditingController _DescrptionController = TextEditingController();
  String _description = "";
  List<File> imgFile = [];
  List<List<File>> roomDetailImg = [];
  final imgPicker = ImagePicker();
  List<List<bool>> select = [];
  List<List<int>> featureissueId = [];
  List<int> selectedbox = [];
  List selectedCheckbox = [];
  List<List<String>> FeatureissueName = [];
  List<List<int>> FeatureissueId = [];
  List<bool> DataLoding = [];

  Widget build(BuildContext context) {
    final _roomsfeature = useProvider(customernotifier);
    final size = MediaQuery.of(context).size;
    print("cndcndlcn" + roomid.toString());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppTheme.colorPrimary),
              child: Center(
                child: Text(
                  "Create a Project",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: lightColor.withOpacity(.9),
                      ),
                ),
              ),
            ),
            Expanded(
              child: loading
                  ? LoadingWidget()
                  : Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(children: [
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
                                  controller: _DescrptionController,
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.colorPrimary,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        _DescrptionController.text.isEmpty
                                            ? ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                content:
                                                    Text('Add description'),
                                              ))
                                            : _description =
                                                _DescrptionController.text;
                                        _DescrptionController.clear();
                                      },
                                    ),
                                    width: 50,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.82,
                                child: Text(
                                  "2. Add photos of exceptional features or selling advantages",
                                  maxLines: 2,
                                ),
                              ),
                              IconButton(
                                  // padding: EdgeInsets.zero,
                                  onPressed: () {
                                    showOptionsDialog(context, 0, 0);
                                  },
                                  icon: Icon(
                                    Icons.add_box,
                                    color:
                                        AppTheme.colorPrimary.withOpacity(0.6),
                                  ))
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
                          imgFile.isEmpty
                              ? SizedBox()
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: moresecond
                                      ? imgFile.length + 1
                                      : imgFile.length >= 10
                                          ? 10
                                          : imgFile.length,
                                  itemBuilder:
                                      (BuildContext context, int Index) {
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
                                        Index >= 9 && moresecond == false
                                            ? GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    moresecond = true;
                                                  });
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    Icons.more_horiz,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            : imgFile.length > Index
                                                // roomDetailImg[index].length >
                                                //         Index
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            6.0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Container(
                                                          // height: 60,
                                                          // width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: FileImage(
                                                                imgFile[Index],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: -7,
                                                          right: -7,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                imgFile
                                                                    .removeAt(
                                                                        Index);
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
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        moresecond = false;
                                                      });
                                                    },
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1.2,
                                          crossAxisCount: 5),
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Fireplace = !Fireplace;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: AppTheme.colorPrimary,
                                        value: Fireplace,
                                        onChanged: (value) {
                                          setState(() {
                                            Fireplace = value!;
                                          });
                                        },
                                      ),
                                      Text("Fireplace"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Upgraded_Appliances =
                                          !Upgraded_Appliances;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: AppTheme.colorPrimary,
                                        value: Upgraded_Appliances,
                                        onChanged: (value) {
                                          setState(() {
                                            Upgraded_Appliances = value!;
                                          });
                                        },
                                      ),
                                      Text("Upgraded Appliances"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Custom_Cabinetry = !Custom_Cabinetry;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: AppTheme.colorPrimary,
                                        value: Custom_Cabinetry,
                                        onChanged: (value) {
                                          setState(() {
                                            Custom_Cabinetry = value!;
                                          });
                                        },
                                      ),
                                      Text("Custom Cabinetry"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Text("Overall first impressions"),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      DAZLING = !DAZLING;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: AppTheme.colorPrimary,
                                        value: DAZLING,
                                        onChanged: (value) {
                                          setState(() {
                                            DAZLING = value!;
                                          });
                                        },
                                      ),
                                      Text("DAZLING"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      MARKET_READY = !MARKET_READY;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: AppTheme.colorPrimary,
                                        value: MARKET_READY,
                                        onChanged: (value) {
                                          setState(() {
                                            MARKET_READY = value!;
                                          });
                                        },
                                      ),
                                      Text("MARKET READY"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      NEEDS_DAZL = !NEEDS_DAZL;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: AppTheme.colorPrimary,
                                        value: NEEDS_DAZL,
                                        onChanged: (value) {
                                          setState(() {
                                            NEEDS_DAZL = value!;
                                          });
                                        },
                                      ),
                                      Text("NEEDS DAZL"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ListView.separated(
                            // shrinkWrap: true,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // CatagoryExample(
                                  //     roomFeature:
                                  //         _roomsfeature.listOfFeature[index],
                                  //     index: index,
                                  //     listOfFeature:
                                  //         _roomsfeature.listOfFeature,

                                  //     select: select),
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: AppTheme.colorPrimary,
                                          value: selectedbox.contains(index),
                                          onChanged: (val) async {
                                            if (selectedbox.contains(index)) {
                                              selectedbox.remove(index);
                                              select[index].clear();
                                              featureId[index] = 0;
                                              FeatureissueName[index].clear();
                                              FeatureissueId[index].clear();
                                              setState(() {});
                                            } else {
                                              setState(() {
                                                DataLoding[index] = true;
                                              });
                                              setState(() {
                                                selectedbox.add(index);
                                                featureId[index] = _roomsfeature
                                                    .listOfFeature[index].id;
                                              });

                                              await context
                                                  .read(customernotifier)
                                                  .getfeatureissue(
                                                      featureId[index]);
                                              setState(() {
                                                DataLoding[index] = false;
                                              });
                                              for (int i = 0;
                                                  i <
                                                      _roomsfeature
                                                          .listOfissues.length;
                                                  i++) {
                                                select[index].add(false);
                                                FeatureissueName[index].add(
                                                    _roomsfeature
                                                        .listOfissues[i].name);

                                                FeatureissueId[index].add(
                                                    _roomsfeature
                                                        .listOfissues[i].id);
                                                // featureissueId[index].add(
                                                //     _roomsfeature
                                                //         .listOfissues[i].id);
                                              }
                                              // indexs = 0;
                                            }
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
                                      ),
                                      Spacer(),
                                      selectedbox.contains(index)
                                          ? IconButton(
                                              onPressed: () {
                                                showOptionsDialog(
                                                    context, 1, index);
                                              },
                                              icon: Icon(
                                                Icons.add_box,
                                                color: AppTheme.colorPrimary
                                                    .withOpacity(0.6),
                                              ))
                                          : SizedBox()
                                    ],
                                  ),

                                  selectedbox.contains(index)
                                      ? Column(children: [
                                          DataLoding[index] == true
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15, right: 15),
                                                      child: LinearProgressIndicator(
                                                          backgroundColor:
                                                              AppTheme
                                                                  .colorPrimary
                                                                  .withOpacity(
                                                                      0.2),
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  AppTheme
                                                                      .colorPrimary
                                                                      .withOpacity(
                                                                          0.5))),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15, right: 15),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Wrap(
                                                            // crossAxisAlignment:
                                                            //     CrossAxisAlignment
                                                            //         .start,
                                                            // mainAxisAlignment:
                                                            //     // currentoptionselected[
                                                            //     //             index] !=
                                                            //     //         ''
                                                            //     //     ? MainAxisAlignment
                                                            //     //         .spaceAround
                                                            //     //     :
                                                            //     MainAxisAlignment
                                                            //         .start,
                                                            children:  [
                                                              for (int i = 0;
                                                                  i <
                                                                      FeatureissueName[
                                                                              index]
                                                                          .length;
                                                                  i++)
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          4.0),
                                                                  child: ChoiceChip(
                                                                      selectedColor: AppTheme.colorPrimary,
                                                                      label: Text(
                                                                        FeatureissueName[index][i]
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color: select[index][i] == true
                                                                                ? Colors.white
                                                                                : Colors.black),
                                                                      ),
                                                                      onSelected: (value) {
                                                                        setState(
                                                                            () {
                                                                          select[index][i] =
                                                                              value;
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          if (selectedCheckbox.contains(select[index]
                                                                              [
                                                                              i])) {
                                                                            selectedCheckbox.remove(select[index][i]);
                                                                          } else {
                                                                            selectedCheckbox.add(select[index][i]);
                                                                          }
                                                                          if (select[index][i] ==
                                                                              true) {
                                                                            FeatureissueId[index].add(featureissueId[index][i]);
                                                                            setState(() {});
                                                                          } else {
                                                                            FeatureissueId[index].remove(featureissueId[index][i]);
                                                                            setState(() {});
                                                                          }
                                                                        });
                                                                      },
                                                                      selected: select[index][i]),
                                                                ),
                                                            ]),
                                                      ),
                                                    ),
                                                    // GestureDetector(
                                                    //   onTap: () {
                                                    //     showOptionsDialog(
                                                    //         context, 1);
                                                    //   },
                                                    //   child: Row(
                                                    //     children: [
                                                    //       Container(
                                                    //         width: size.width *
                                                    //             0.83,
                                                    //         padding:
                                                    //             EdgeInsets.only(
                                                    //                 top: 7,
                                                    //                 bottom: 7,
                                                    //                 left: 12,
                                                    //                 right: 12),
                                                    //         decoration: BoxDecoration(
                                                    //             color: AppTheme
                                                    //                 .colorPrimary
                                                    //                 .withOpacity(
                                                    //                     0.4),
                                                    //             borderRadius:
                                                    //                 BorderRadius
                                                    //                     .circular(
                                                    //                         15)),
                                                    //         child: Center(
                                                    //           child: Text(
                                                    //               'Add Photos'),
                                                    //         ),
                                                    //       ),
                                                    //       SizedBox(
                                                    //         width: 10,
                                                    //       ),
                                                    //       CircleAvatar(
                                                    //         radius: 18,
                                                    //         backgroundColor:
                                                    //             AppTheme
                                                    //                 .colorPrimary
                                                    //                 .withOpacity(
                                                    //                     0.6),
                                                    //         child: IconButton(
                                                    //           onPressed: () {
                                                    //             if (imgGalleryRoom !=
                                                    //                 null) {
                                                    //               textphotoRoom(
                                                    //                   index);
                                                    //             }
                                                    //             if (imgCameraRoom !=
                                                    //                 null) {
                                                    //               photocameraRoom(
                                                    //                   index);
                                                    //             }
                                                    //           },
                                                    //           icon: Icon(
                                                    //             Icons.send,
                                                    //             color: Colors
                                                    //                 .white,
                                                    //             size: 18,
                                                    //           ),
                                                    //         ),
                                                    //       )
                                                    //     ],
                                                    //   ),

                                                    //   //             Expanded(
                                                    //   //               // width: 160,
                                                    //   //               // height: 180,
                                                    //   //               child:

                                                    //   //               //     GridView.builder(
                                                    //   //               //   physics:
                                                    //   //               //       NeverScrollableScrollPhysics(),
                                                    //   //               //   shrinkWrap: true,
                                                    //   //               //   itemCount:
                                                    //   //               //       FeatureissueName[
                                                    //   //               //               index]
                                                    //   //               //           .length,
                                                    //   //               //   // FeatureissueName[
                                                    //   //               //   //         index]
                                                    //   //               //   //     .length,
                                                    //   //               //   itemBuilder:
                                                    //   //               //       (BuildContext
                                                    //   //               //               context,
                                                    //   //               //           int subindex) {
                                                    //   //               //     return ChoiceChip(
                                                    //   //               //         selectedColor:
                                                    //   //               //             AppTheme
                                                    //   //               //                 .colorPrimary,
                                                    //   //               //         label: Text(
                                                    //   //               //           FeatureissueName[index]
                                                    //   //               //                   [
                                                    //   //               //                   subindex]
                                                    //   //               //               .toString(),
                                                    //   //               //           style: TextStyle(
                                                    //   //               //               color: select[index][subindex] ==
                                                    //   //               //                       true
                                                    //   //               //                   ? Colors.white
                                                    //   //               //                   : Colors.black),
                                                    //   //               //         ),
                                                    //   //               //         onSelected:
                                                    //   //               //             (value) {
                                                    //   //               //           setState(
                                                    //   //               //               () {
                                                    //   //               //             select[index]
                                                    //   //               //                     [
                                                    //   //               //                     subindex] =
                                                    //   //               //                 value!;
                                                    //   //               //           });
                                                    //   //               //           setState(
                                                    //   //               //               () {
                                                    //   //               //             if (selectedCheckbox.contains(
                                                    //   //               //                 select[index]
                                                    //   //               //                     [
                                                    //   //               //                     subindex])) {
                                                    //   //               //               selectedCheckbox.remove(select[index]
                                                    //   //               //                   [
                                                    //   //               //                   subindex]);
                                                    //   //               //             } else {
                                                    //   //               //               selectedCheckbox.add(select[index]
                                                    //   //               //                   [
                                                    //   //               //                   subindex]);
                                                    //   //               //             }
                                                    //   //               //             if (select[index]
                                                    //   //               //                     [
                                                    //   //               //                     subindex] ==
                                                    //   //               //                 true) {
                                                    //   //               //               FeatureissueId[index].add(featureissueId[index]
                                                    //   //               //                   [
                                                    //   //               //                   subindex]);
                                                    //   //               //               setState(
                                                    //   //               //                   () {});
                                                    //   //               //             } else {
                                                    //   //               //               FeatureissueId[index].remove(featureissueId[index]
                                                    //   //               //                   [
                                                    //   //               //                   subindex]);
                                                    //   //               //               setState(
                                                    //   //               //                   () {});
                                                    //   //               //             }
                                                    //   //               //           });
                                                    //   //               //         },
                                                    //   //               //         selected: select[
                                                    //   //               //                 index]
                                                    //   //               //             [
                                                    //   //               //             subindex]);
                                                    //   //               //     //  CheckboxListTile(
                                                    //   //               //     //   title: Text(FeatureissueName[
                                                    //   //               //     //               index]
                                                    //   //               //     //           [
                                                    //   //               //     //           subindex]
                                                    //   //               //     //       .toString()),
                                                    //   //               //     //   contentPadding:
                                                    //   //               //     //       EdgeInsets
                                                    //   //               //     //           .all(0),
                                                    //   //               //     //   controlAffinity:
                                                    //   //               //     //       ListTileControlAffinity
                                                    //   //               //     //           .leading,
                                                    //   //               //     //   activeColor:
                                                    //   //               //     //       AppTheme
                                                    //   //               //     //           .colorPrimary,
                                                    //   //               //     //   onChanged:
                                                    //   //               //     //       (bool?
                                                    //   //               //     //           value) {
                                                    //   //               //     //     setState(() {
                                                    //   //               //     //       select[index]
                                                    //   //               //     //               [
                                                    //   //               //     //               subindex] =
                                                    //   //               //     //           value!;
                                                    //   //               //     //     });
                                                    //   //               //     //     setState(() {
                                                    //   //               //     //       if (selectedCheckbox.contains(
                                                    //   //               //     //           select[index]
                                                    //   //               //     //               [
                                                    //   //               //     //               subindex])) {
                                                    //   //               //     //         selectedCheckbox.remove(
                                                    //   //               //     //             select[index]
                                                    //   //               //     //                 [
                                                    //   //               //     //                 subindex]);
                                                    //   //               //     //       } else {
                                                    //   //               //     //         selectedCheckbox.add(
                                                    //   //               //     //             select[index]
                                                    //   //               //     //                 [
                                                    //   //               //     //                 subindex]);
                                                    //   //               //     //       }
                                                    //   //               //     //       if (select[index]
                                                    //   //               //     //               [
                                                    //   //               //     //               subindex] ==
                                                    //   //               //     //           true) {
                                                    //   //               //     //         FeatureissueId[
                                                    //   //               //     //                 index]
                                                    //   //               //     //             .add(featureissueId[index]
                                                    //   //               //     //                 [
                                                    //   //               //     //                 subindex]);
                                                    //   //               //     //         setState(
                                                    //   //               //     //             () {});
                                                    //   //               //     //       } else {
                                                    //   //               //     //         FeatureissueId[
                                                    //   //               //     //                 index]
                                                    //   //               //     //             .remove(featureissueId[index]
                                                    //   //               //     //                 [
                                                    //   //               //     //                 subindex]);
                                                    //   //               //     //         setState(
                                                    //   //               //     //             () {});
                                                    //   //               //     //       }
                                                    //   //               //     //     });
                                                    //   //               //     //   },
                                                    //   //               //     //   value: select[
                                                    //   //               //     //           index]
                                                    //   //               //     //       [subindex],
                                                    //   //               //     // );
                                                    //   //               //   },

                                                    //   //               //   gridDelegate:
                                                    //   //               //       SliverGridDelegateWithFixedCrossAxisCount(
                                                    //   //               //     childAspectRatio:
                                                    //   //               //         3,
                                                    //   //               //     crossAxisCount: 3,
                                                    //   //               //   ),
                                                    //   //               // ),

                                                    //   //             )
                                                    //   //           ],
                                                    //   //         ),
                                                    //   //       ),
                                                    //   // GestureDetector(
                                                    //   //   onTap: () {
                                                    //   //     showOptionsDialog(context, 1);
                                                    //   //   },
                                                    //   //   child: Row(
                                                    //   //     children: [
                                                    //   //       Container(
                                                    //   //         width: size.width * 0.83,
                                                    //   //         padding: EdgeInsets.only(
                                                    //   //             top: 7,
                                                    //   //             bottom: 7,
                                                    //   //             left: 12,
                                                    //   //             right: 12),
                                                    //   //         decoration: BoxDecoration(
                                                    //   //             color: AppTheme
                                                    //   //                 .colorPrimary
                                                    //   //                 .withOpacity(0.4),
                                                    //   //             borderRadius:
                                                    //   //                 BorderRadius
                                                    //   //                     .circular(15)),
                                                    //   //         child: Center(
                                                    //   //           child: Text('Add Photos'),
                                                    //   //         ),
                                                    //   //       ),
                                                    //   //       SizedBox(
                                                    //   //         width: 10,
                                                    //   //       ),
                                                    //   //       CircleAvatar(
                                                    //   //         radius: 18,
                                                    //   //         backgroundColor: AppTheme
                                                    //   //             .colorPrimary
                                                    //   //             .withOpacity(0.6),
                                                    //   //         child: IconButton(
                                                    //   //             onPressed: () {
                                                    //   //               if (imgGalleryRoom !=
                                                    //   //                   null) {
                                                    //   //                 textphotoRoom(
                                                    //   //                     index);
                                                    //   //               }
                                                    //   //               if (imgCameraRoom !=
                                                    //   //                   null) {
                                                    //   //                 photocameraRoom(
                                                    //   //                     index);
                                                    //   //               }
                                                    //   //             },
                                                    //   //             icon: Icon(
                                                    //   //               Icons.send,
                                                    //   //               color: Colors.white,
                                                    //   //               size: 18,
                                                    //   //             )),
                                                    //   //       )
                                                    //   //     ],
                                                    //   //   ),
                                                    //   // ),
                                                    //   // SizedBox(
                                                    //   //   height: 10,
                                                    // ),
                                                    // // // roomDetailImg[index] == null ||
                                                    // roomDetailImg[index].toString() ==
                                                    //         File('').toString()
                                                    roomDetailImg[index].isEmpty
                                                        ? SizedBox()
                                                        : GridView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount: more
                                                                ? roomDetailImg[
                                                                            index]
                                                                        .length +
                                                                    1
                                                                : roomDetailImg[index]
                                                                            .length >=
                                                                        10
                                                                    ? 10
                                                                    : roomDetailImg[
                                                                            index]
                                                                        .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int Index) {
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
                                                                  Index >= 9 &&
                                                                          more ==
                                                                              false
                                                                      ? GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              more = true;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Icon(
                                                                              Icons.more_horiz,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : roomDetailImg[index].length >
                                                                              Index
                                                                          // roomDetailImg[index].length >
                                                                          //         Index
                                                                          ? Padding(
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
                                                                                          roomDetailImg[index][Index],
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
                                                                                          roomDetailImg[index].removeAt(Index);
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
                                                                            )
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  more = false;
                                                                                });
                                                                              },
                                                                              child: Center(
                                                                                child: Icon(
                                                                                  Icons.cancel,
                                                                                  color: Colors.grey,
                                                                                ),
                                                                              ),
                                                                            );
                                                            },
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                                    childAspectRatio:
                                                                        1.2,
                                                                    crossAxisCount:
                                                                        5),
                                                          ),
                                                  ],
                                                )
                                        ])
                                      : Container(),

                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.end,
                                  //   children: [
                                  //     Container(
                                  //       height: size.height * 0.22,
                                  //       width: size.width / 2,
                                  //       child: ListView.builder(
                                  //           //shrinkWrap: true,
                                  //           shrinkWrap: true,
                                  //           physics:
                                  //               NeverScrollableScrollPhysics(),
                                  //           itemCount: 3,
                                  //           itemBuilder: (context, subindex) {
                                  //             return CheckboxListTile(
                                  //               controlAffinity:
                                  //                   ListTileControlAffinity
                                  //                       .leading,
                                  //               // value: select[index].contains(subindex),
                                  //               value: select[index][subindex],
                                  //               activeColor:
                                  //                   AppTheme.colorPrimary,
                                  //               onChanged: (val) {
                                  //                 log(val.toString());
                                  //                 setState(() {
                                  //                   if (select[index]
                                  //                           [subindex] ==
                                  //                       true) {
                                  //                     // select[index].remove(false);
                                  //                     select[index][subindex] =
                                  //                         false;
                                  //                   } else {
                                  //                     // select[index].add(true);
                                  //                     select[index][subindex] =
                                  //                         true;
                                  //                     featureId[index] =
                                  //                         _roomsfeature
                                  //                             .listOfFeature[
                                  //                                 index]
                                  //                             .id;
                                  //                   }
                                  //                 });
                                  //                 context
                                  //                     .read(customernotifier)
                                  //                     .getfeatureissue(
                                  //                         featureId[index]);
                                  //               },
                                  //               title: Text(
                                  //                   "${subindex == 0 ? "DAZLING" : subindex == 1 ? "MARKET READY" : "NEEDS DAZL"}"),
                                  //             );
                                  //           }),
                                  //     ),
                                  //     select[index][2] == true
                                  //         ? Container(
                                  //             width: size.width * 0.4,
                                  //             margin:
                                  //                 EdgeInsets.only(bottom: 10),
                                  //             child: DropdownButton(
                                  //                 isExpanded: true,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(20),
                                  //                 // hint: currentoptionselected[
                                  //                 //             index] ==
                                  //                 //         ''
                                  //                 //     ? Text('Select Option')
                                  //                 //     : Text(
                                  //                 //         currentoptionselected[
                                  //                 //             index]),
                                  //                 items: _roomsfeature
                                  //                     .listOfissues
                                  //                     .where((c) =>
                                  //                         c.featureId ==
                                  //                         featureId[index])
                                  //                     .map((dropdownselect) {
                                  //                   return DropdownMenuItem<
                                  //                       String>(
                                  //                     child: Text(
                                  //                         dropdownselect.name),
                                  //                     value:
                                  //                         dropdownselect.name,
                                  //                     // onTap: () {
                                  //                     //   currenoptionselectedid[
                                  //                     //           index] =
                                  //                     //       dropdownselect.id;
                                  //                     // },
                                  //                   );
                                  //                 }).toList(),
                                  //                 onChanged: (val) {}),
                                  //           )
                                  //         : Container(),
                                  //   ],
                                  // ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: _roomsfeature.listOfFeature.length,
                          ),
                        ]),
                      ),
                    ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppTheme.colorPrimary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppTheme.white,
                        ),
                        Text(
                          "Previous",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                    color: lightColor.withOpacity(.9),
                                  ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>selectRoom()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Finish",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                    color: lightColor.withOpacity(.9),
                                  ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: AppTheme.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showOptionsDialog(
      BuildContext context, int index, int ListIndex) {
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
                      index == 0 ? openCamera() : openCameraRoom(ListIndex);
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
                      index == 0 ? openGallery() : openGalleryRoom(ListIndex);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  late var imgCamera;
  void openCamera() async {
    imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    if (imgCamera != null) {
      photocamera();
    }
    Navigator.of(context).pop();
  }

  late var imgGallery;
  void openGallery() async {
    imgGallery = await imgPicker.getMultiImage();
    if (imgGallery != null) {
      textphoto();
    }
    Navigator.of(context).pop();
  }

  void textphoto() {
    setState(() {
      if (imgGallery == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add Photo'),
        ));
      } else {
        for (int i = 0; i < imgGallery.length; i++) {
          imgFile.add(File(imgGallery[i].path));
        }

        imgGallery = null;
      }
    });
  }

  void photocamera() {
    setState(() {
      if (imgCamera == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add description or Photo'),
        ));
      } else {
        imgFile.add(File(imgCamera.path));
        imgCamera = null;
      }
    });
  }

  late var imgCameraRoom;
  void openCameraRoom(int index) async {
    imgCameraRoom = await imgPicker.getImage(source: ImageSource.camera);
    if (imgCameraRoom != null) {
      setState(() {
        roomDetailImg[index].add(File(imgCameraRoom.path));
        imgCameraRoom = null;
      });
    }
    Navigator.of(context).pop();
  }

  late var imgGalleryRoom;
  void openGalleryRoom(int index) async {
    imgGalleryRoom = await imgPicker.getMultiImage();
    if (imgGalleryRoom != null) {
      setState(() {
        for (int i = 0; i < imgGalleryRoom.length; i++) {
          roomDetailImg[index].add(File(imgGalleryRoom[i].path));
        }
        imgGalleryRoom = null;
      });
    }
    Navigator.of(context).pop();
  }

  void textphotoRoom(int index) {
    setState(() {
      if (imgGalleryRoom == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add Photo'),
        ));
      } else {
        roomDetailImg[index].add(File(imgGalleryRoom.path));
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
        roomDetailImg[index].add(File(imgCameraRoom.path));
        log(roomDetailImg.toString());
        imgCameraRoom = null;
      }
    });
  }
}

class CatagoryExample extends StatefulHookWidget {
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
  State<CatagoryExample> createState() => _CatagoryExampleState();
}

class _CatagoryExampleState extends State<CatagoryExample> {
  loaddata() async {
    final _roomsfeature = context.read(customernotifier);

    await _roomsfeature.getRoomsFeature(roomid);
    await _roomsfeature.getFeatureOptionIssues();
  }

  @override
  void initState() {
    // TODO: implement initState
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _roomsfeature = useProvider(customernotifier);

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
                        context.read(customernotifier).getfeatureissue(
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
