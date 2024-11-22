import 'dart:io';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/home/component/CommonHeader.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/phdProvider.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditPhd extends ConsumerStatefulWidget {
  const EditPhd({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<EditPhd> createState() => _EditPhdState();
}

class _EditPhdState extends ConsumerState<EditPhd> {
  late PhdProvider _phdProvider;
  @override
  void initState() {
    super.initState();
    _phdProvider = ref.read(phdProvider);
    if (mounted) {
      setState(() {});
    }
  }

  int indexs = 0;
  bool loading = true;

  Widget build(BuildContext context) {
    _phdProvider = ref.watch(phdProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child:Container(
               
                child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        CommonHeader(
                  title: "Edit PHD Project-Summary",
                  isback: false,
                ),
                SizedBox(
                  height: 20,
                ),
                      Text(
                          "1. Note any exceptional features or selling advantage:"),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   height: size.height * 0.12,
                      //   padding: EdgeInsets.only(left: 15),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //           color: AppTheme.grey.withOpacity(0.5),
                      //           width: 2),
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.white),
                      //   child: Stack(
                      //     children: [
                      //       TextFormField(
                      //         controller: _phdProvider
                      //             .allRoomsData[_phdProvider.tabIndex]
                      //             .singleTabController,
                      //         minLines: 2,
                      //         maxLines: 100,
                      //         textInputAction: TextInputAction.done,
                      //         cursorColor: AppTheme.colorPrimary,
                      //         decoration: InputDecoration(
                      //             hintText: "",
                      //             hintStyle:
                      //                 Theme.of(context).textTheme.bodyLarge,
                      //             focusedBorder: UnderlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     color: Colors.transparent)),
                      //             enabledBorder: UnderlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     color: Colors.transparent)),
                      //             border: UnderlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     color: Colors.transparent))),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
                        child: Text(
                          "2. Add photos of exceptional features or selling advantages",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: GridView.builder(
                      //     shrinkWrap: true,
                      //     padding: EdgeInsets.zero,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     itemCount: _phdProvider
                      //             .allRoomsData[_phdProvider.tabIndex]
                      //             .images!
                      //             .length +
                      //         1,
                      //     itemBuilder: (BuildContext context, int Index) {
                      //       if (Index == 0) {
                      //         return Container(
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.black),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: IconButton(
                      //               onPressed: () {
                      //                 showOptionsDialog(context, 0, 0, true);
                      //               },
                      //               icon: Icon(Icons.add_a_photo)),
                      //         );
                      //       }

                      //       return Padding(
                      //         padding: EdgeInsets.zero,
                      //         child: Stack(
                      //           clipBehavior: Clip.none,
                      //           children: [
                      //             Container(
                      //               margin: EdgeInsets.only(left: 5),
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 image: DecorationImage(
                      //                   fit: BoxFit.fill,
                      //                   image: NetworkImage(
                      //                     _phdProvider
                      //                         .allRoomsData[
                      //                             _phdProvider.tabIndex]
                      //                         .images![Index - 1],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Positioned(
                      //               top: -7,
                      //               right: -7,
                      //               child: GestureDetector(
                      //                 onTap: () {
                      //                   setState(() {
                      //                     _phdProvider
                      //                         .allRoomsData[
                      //                             _phdProvider.tabIndex]
                      //                         .images!
                      //                         .removeAt(Index - 1);
                      //                   });
                      //                 },
                      //                 child: Icon(
                      //                   Icons.cancel,
                      //                   size: 20,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //     gridDelegate:
                      //         SliverGridDelegateWithFixedCrossAxisCount(
                      //             childAspectRatio: 1.2, crossAxisCount: 5),
                      //   ),
                      // ),
                      
                      SizedBox(
                        height: 10,
                      ),
                      // _phdProvider.allRoomsData[_phdProvider.tabIndex].roomtype!
                      //             .length <=
                      //         0
                      //     ? SizedBox(height: 10)
                      //     : SizedBox(
                      //         height: 60,
                      //         width: size.width,
                      //         child: ListView.separated(
                      //           separatorBuilder: (context, index) {
                      //             return SizedBox(
                      //               width: size.width * 0.1 - 16,
                      //             );
                      //           },
                      //           padding: EdgeInsets.all(8),
                      //           scrollDirection: Axis.horizontal,
                      //           itemCount: _phdProvider
                      //               .allRoomsData[_phdProvider.tabIndex]
                      //               .roomtype!
                      //               .length,
                      //           itemBuilder: (context, index) {
                      //             String dropdownName = _phdProvider
                      //                     .allRoomsData[_phdProvider.tabIndex]
                      //                     .roomtype![index]
                      //                     .selectedtype ??
                      //                 '';
                      //             return Container(
                      //               padding:
                      //                   EdgeInsets.symmetric(horizontal: 10),
                      //               decoration: BoxDecoration(
                      //                   border: Border.all(color: blackColor)),
                      //               child: Center(
                      //                 child: DropdownButton<AddValueData>(
                      //                   borderRadius: BorderRadius.zero,
                      //                   underline: Container(),
                      //                   hint: Container(
                      //                     padding: EdgeInsets.symmetric(
                      //                         horizontal: 4.0),
                      //                     child: Text(
                      //                       dropdownName.isEmpty
                      //                           ? _phdProvider
                      //                               .allRoomsData[
                      //                                   _phdProvider.tabIndex]
                      //                               .roomtype![index]
                      //                               .type!
                      //                               .name!
                      //                           : dropdownName,
                      //                       style:
                      //                           TextStyle(color: darkTextColor),
                      //                     ),
                      //                   ),
                      //                   items: _phdProvider
                      //                       .allRoomsData[_phdProvider.tabIndex]
                      //                       .roomtype![index]
                      //                       .type!
                      //                       .featureOptions!
                      //                       .map((value) {
                      //                     return DropdownMenuItem<AddValueData>(
                      //                       value: value,
                      //                       child: Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               horizontal: 8.0),
                      //                           child: Text(
                      //                             value.name.toString(),
                      //                           )),
                      //                     );
                      //                   }).toList(),
                      //                   onChanged: (value) {
                      //                     _phdProvider.selectRoomType(
                      //                         data: value!, index: index);
                      //                     setState(() {});
                      //                   },
                      //                 ),
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       ),
                    
                    
                      // if (_phdProvider.allRoomsData[_phdProvider.tabIndex]
                      //     .addValueData!.isNotEmpty)
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: Text(
                            "3. Are there any additional value added  items",
                          ),
                        ),
                      // _phdProvider.allRoomsData[_phdProvider.tabIndex]
                      //             .addValueData!.length <=
                      //         0
                      //     ? SizedBox()
                      //     : SizedBox(
                      //         height: 60,
                      //         child: ListView.separated(
                      //           shrinkWrap: true,
                      //           scrollDirection: Axis.horizontal,
                      //           separatorBuilder: (context, index) => SizedBox(
                      //             width: 15,
                      //           ),
                      //           itemCount: _phdProvider
                      //               .allRoomsData[_phdProvider.tabIndex]
                      //               .addValueData!
                      //               .length,
                      //           itemBuilder: (context, index) {
                      //             return Row(
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: [
                      //                 Checkbox(
                      //                   checkColor: lightColor,
                      //                   activeColor: AppTheme.colorPrimary,
                      //                   value: _phdProvider
                      //                           .allRoomsData[
                      //                               _phdProvider.tabIndex]
                      //                           .addValueData![index]
                      //                           .optionSelected ??
                      //                       false,
                      //                   onChanged: (value) {
                      //                     _phdProvider.SelectAddValueData(
                      //                         value: value!, index: index);
                      //                     setState(() {});
                      //                   },
                      //                 ),
                      //                 Text(
                      //                   "${_phdProvider.allRoomsData[_phdProvider.tabIndex].addValueData![index].name}",
                      //                   style: TextStyle(color: darkTextColor),
                      //                 ),
                      //               ],
                      //             );
                      //           },
                      //         ),
                      //       ),

                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 2.0),
                        child: Text(
                          " 4. Has the basement been finished since last listing?",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio<String>(
                            value: "Yes",
                            groupValue: _selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                          ),
                          Text("Yes"),
                          SizedBox(width: 20),
                          Radio<String>(
                            value: "No",
                            groupValue: _selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                          ),
                          Text("No"),
                        ],
                      ),

                      // Conditionally show the dropdown if "Yes" is selected
                      if (_selectedOption == "Yes")
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: AppTheme.darkerText,
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: DropdownButton<String>(
                                  value: _selectedDropdownValue,
                                  dropdownColor: AppTheme.white,
                                  underline: SizedBox(),
                                  hint: Text("Select value "),
                                  items: _dropdownItems.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedDropdownValue = newValue;
                                    });
                                  },
                                ),
                              ),
                              if (_selectedDropdownValue == "Other")
                                Container(
                                  height: 50,
                                  width: 200,
                                  margin: EdgeInsets.only(left: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        focusColor: AppTheme.white,
                                        prefix: Text(
                                          "\$ ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter Custom Value',
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: AppTheme.grey)),
                                  ),
                                ),
                            ],
                          ),
                        ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Overall first impressions"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // ListView.builder(
                      //   padding: EdgeInsets.zero,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   itemCount: _phdProvider.fristImpressionList.length,
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) {
                      //     return Row(
                      //       children: [
                      //         Radio<String>(
                      //           activeColor: primaryColor,
                      //           value: _phdProvider.fristImpressionList[index],
                      //           groupValue: _phdProvider
                      //               .allRoomsData[_phdProvider.tabIndex]
                      //               .impressions,
                      //           onChanged: (String? value) {
                      //             _phdProvider
                      //                 .allRoomsData[_phdProvider.tabIndex]
                      //                 .impressions = value!;
                      //             setState(() {});
                      //           },
                      //         ),
                      //         Text(
                      //           _phdProvider.fristImpressionList[index],
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w900,
                      //               color: darkTextColor),
                      //         )
                      //       ],
                      //     );
                      //   },
                      // ),
                 
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Buyer Road Blocks or Recommendations?",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // ListView.separated(
                      //   padding: EdgeInsets.zero,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: _phdProvider
                      //       .allRoomsData[_phdProvider.tabIndex].data!.length,
                      //   separatorBuilder: (BuildContext context, int index) {
                      //     return SizedBox(
                      //       height: 10,
                      //     );
                      //   },
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Column(
                      //       children: [
                      //         Row(
                      //           children: [
                      //             Checkbox(
                      //                 checkColor: lightColor,
                      //                 activeColor: AppTheme.colorPrimary,
                      //                 value: _phdProvider
                      //                     .allRoomsData[_phdProvider.tabIndex]
                      //                     .data![index]
                      //                     .selectedFeatureForOneTabs
                      //                     .checkBox,
                      //                 onChanged: (val) {
                      //                   _phdProvider.changeCheckBox(
                      //                       tabIndex: _phdProvider.tabIndex,
                      //                       selectedFeatureIndex: index,
                      //                       value: val!,
                      //                       setFeatureId: _phdProvider
                      //                           .allRoomsData[
                      //                               _phdProvider.tabIndex]
                      //                           .data![index]
                      //                           .id);
                      //                 }),
                      //             Text(
                      //               _phdProvider
                      //                   .allRoomsData[_phdProvider.tabIndex]
                      //                   .data![index]
                      //                   .name,
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .bodyLarge!
                      //                   .copyWith(
                      //                     fontWeight: FontWeight.w600,
                      //                     fontSize: 16,
                      //                     color: AppTheme.darkerText,
                      //                   ),
                      //             )
                      //           ],
                      //         ),
                      //         // _phdProvider
                      //         //         .allRoomsData[_phdProvider.tabIndex]
                      //         //         .data![index]
                      //         //         .selectedFeatureForOneTabs
                      //         //         .checkBox
                      //         //     ? Container(
                      //         //         padding:
                      //         //             EdgeInsets.only(left: 15, right: 15),
                      //         //         child: Column(
                      //         //           children: [
                      //         //             SizedBox(
                      //         //               height: 10,
                      //         //             ),
                      //         //             Container(
                      //         //               height: size.height * 0.12,
                      //         //               padding: EdgeInsets.only(left: 15),
                      //         //               decoration: BoxDecoration(
                      //         //                   border: Border.all(
                      //         //                       color: AppTheme.grey
                      //         //                           .withOpacity(0.5),
                      //         //                       width: 2),
                      //         //                   borderRadius:
                      //         //                       BorderRadius.circular(10),
                      //         //                   color: Colors.white),
                      //         //               child: Stack(
                      //         //                 children: [
                      //         //                   TextFormField(
                      //         //                     controller: _phdProvider
                      //         //                         .allRoomsData[
                      //         //                             _phdProvider.tabIndex]
                      //         //                         .data![index]
                      //         //                         .selectedFeatureForOneTabs
                      //         //                         .descrptionController,
                      //         //                     minLines: 2,
                      //         //                     maxLines: 100,
                      //         //                     textInputAction:
                      //         //                         TextInputAction.done,
                      //         //                     cursorColor:
                      //         //                         AppTheme.colorPrimary,
                      //         //                     decoration: InputDecoration(
                      //         //                         hintText:
                      //         //                             "Tell us the issue or desired outcome.",
                      //         //                         hintStyle:
                      //         //                             Theme.of(context)
                      //         //                                 .textTheme
                      //         //                                 .bodyLarge,
                      //         //                         focusedBorder:
                      //         //                             UnderlineInputBorder(
                      //         //                                 borderSide: BorderSide(
                      //         //                                     color: Colors
                      //         //                                         .transparent)),
                      //         //                         enabledBorder:
                      //         //                             UnderlineInputBorder(
                      //         //                                 borderSide: BorderSide(
                      //         //                                     color: Colors
                      //         //                                         .transparent)),
                      //         //                         border: UnderlineInputBorder(
                      //         //                             borderSide: BorderSide(
                      //         //                                 color: Colors
                      //         //                                     .transparent))),
                      //         //                   ),
                      //         //                 ],
                      //         //               ),
                      //         //             ),
                      //         //             SizedBox(
                      //         //               height: 10,
                      //         //             ),
                      //         //             _phdProvider
                      //         //                         .allRoomsData[
                      //         //                             _phdProvider.tabIndex]
                      //         //                         .data![index]
                      //         //                         .selectedFeatureForOneTabs
                      //         //                         .images ==
                      //         //                     ''
                      //         //                 ? SizedBox()
                      //         //                 : GridView.builder(
                      //         //                     padding: EdgeInsets.zero,
                      //         //                     physics:
                      //         //                         NeverScrollableScrollPhysics(),
                      //         //                     shrinkWrap: true,
                      //         //                     itemCount: _phdProvider
                      //         //                             .allRoomsData[
                      //         //                                 _phdProvider
                      //         //                                     .tabIndex]
                      //         //                             .data![index]
                      //         //                             .selectedFeatureForOneTabs
                      //         //                             .images
                      //         //                             .length +
                      //         //                         1,
                      //         //                     gridDelegate:
                      //         //                         SliverGridDelegateWithFixedCrossAxisCount(
                      //         //                             crossAxisCount: 4,
                      //         //                             crossAxisSpacing: 4.0,
                      //         //                             mainAxisSpacing: 4.0),
                      //         //                     itemBuilder:
                      //         //                         (context, subIndex) {
                      //         //                       if (subIndex == 0) {
                      //         //                         return Container(
                      //         //                           decoration:
                      //         //                               BoxDecoration(
                      //         //                             border: Border.all(
                      //         //                                 color:
                      //         //                                     Colors.black),
                      //         //                             borderRadius:
                      //         //                                 BorderRadius
                      //         //                                     .circular(10),
                      //         //                           ),
                      //         //                           child: IconButton(
                      //         //                               onPressed: () {
                      //         //                                 showOptionsDialog(
                      //         //                                     context,
                      //         //                                     1,
                      //         //                                     index,
                      //         //                                     false);
                      //         //                               },
                      //         //                               icon: Icon(Icons
                      //         //                                   .add_a_photo)),
                      //         //                         );
                      //         //                       }
                      //         //                       return _phdProvider
                      //         //                                   .allRoomsData[
                      //         //                                       _phdProvider
                      //         //                                           .tabIndex]
                      //         //                                   .data![index]
                      //         //                                   .selectedFeatureForOneTabs
                      //         //                                   .images[subIndex - 1] ==
                      //         //                               ''
                      //         //                           ? SizedBox()
                      //         //                           : Container(
                      //         //                               decoration:
                      //         //                                   BoxDecoration(
                      //         //                                 border: Border.all(
                      //         //                                     color: Colors
                      //         //                                         .black),
                      //         //                                 borderRadius:
                      //         //                                     BorderRadius
                      //         //                                         .circular(
                      //         //                                             10),
                      //         //                               ),
                      //         //                               child: Stack(
                      //         //                                 alignment:
                      //         //                                     Alignment
                      //         //                                         .center,
                      //         //                                 children: [
                      //         //                                   Container(
                      //         //                                     decoration:
                      //         //                                         BoxDecoration(
                      //         //                                       borderRadius:
                      //         //                                           BorderRadius.circular(
                      //         //                                               10),
                      //         //                                       image:
                      //         //                                           DecorationImage(
                      //         //                                         fit: BoxFit
                      //         //                                             .cover,
                      //         //                                         image:
                      //         //                                             NetworkImage(
                      //         //                                           _phdProvider
                      //         //                                               .allRoomsData[_phdProvider.tabIndex]
                      //         //                                               .data![index]
                      //         //                                               .selectedFeatureForOneTabs
                      //         //                                               .images[subIndex - 1],
                      //         //                                         ),
                      //         //                                       ),
                      //         //                                     ),
                      //         //                                   ),
                      //         //                                   Positioned(
                      //         //                                     top: -10,
                      //         //                                     right: -5,
                      //         //                                     child: IconButton(
                      //         //                                         onPressed: () {
                      //         //                                           setState(
                      //         //                                               () {
                      //         //                                             _phdProvider
                      //         //                                                 .allRoomsData[_phdProvider.tabIndex]
                      //         //                                                 .data![index]
                      //         //                                                 .selectedFeatureForOneTabs
                      //         //                                                 .images
                      //         //                                                 .removeAt(subIndex - 1);
                      //         //                                           });
                      //         //                                         },
                      //         //                                         icon: Icon(
                      //         //                                           Icons
                      //         //                                               .cancel,
                      //         //                                           size:
                      //         //                                               25,
                      //         //                                         )),
                      //         //                                   )
                      //         //                                 ],
                      //         //                               ),
                      //         //                             );
                      //         //                     },
                      //         //                   ),
                      //         //           ],
                      //         //         ),
                      //         //       )
                      //         //     : Container()
                      //       ],
                      //     );
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ]),
              ),
            ),
      ),
    );
  }

  String? _selectedOption;
  String? _selectedDropdownValue;
  final List<String> _dropdownItems = [
    "\$5000",
    "\$10000",
    "\$20000",
    "\$50000",
    "Other"
  ];

  Future<void> showOptionsDialog(
      BuildContext context, int index, int ListIndex, bool isMainImg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Select Option",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * .08,
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
                          ? openCamera(
                              isMainImg: isMainImg, dataIndex: ListIndex)
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
  void openCamera({required bool isMainImg, required int dataIndex}) async {
    imgCamera =
        await _phdProvider.imgPicker.getImage(source: ImageSource.camera);
    if (imgCamera != null) {
      photocamera(isMainImg: isMainImg, dataIndex: dataIndex);
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
      toastShowError(context, 'Add Photo');
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Add Photo'),
      // ));
    } else {
      Utils.loaderDialog(context, true);
      for (int i = 0; i < imgGallery!.length; i++) {
        String imageRes = await _phdProvider.getImage(
            context, File(imgGallery![i].path), ref);
        _phdProvider.allRoomsData[_phdProvider.tabIndex].images!.add(imageRes);
      }

      imgGallery = null;
    }

    Utils.loaderDialog(context, false);
    setState(() {});
  }

  Future<void> photocamera(
      {required bool isMainImg, required dataIndex}) async {
    if (imgCamera == null) {
      toastShowError(context, 'Add description or Photo');
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Add description or Photo'),
      // ));
    } else {
      Utils.loaderDialog(context, true);
      String imagePhoto =
          await _phdProvider.getImage(context, File(imgCamera.path), ref);
      _phdProvider.allRoomsData[_phdProvider.tabIndex].images!.add(imagePhoto);

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

      String imagePhoto =
          await _phdProvider.getImage(context, File(imgCameraRoom.path), ref);
      _phdProvider.allRoomsData[_phdProvider.tabIndex].data![index]
          .selectedFeatureForOneTabs.images
          .add(imagePhoto);
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
        String imagePhoto = await _phdProvider.getImage(
            context, File(imgGalleryRoom[i].path), ref);
        _phdProvider.allRoomsData[_phdProvider.tabIndex].data![index]
            .selectedFeatureForOneTabs.images
            .add(imagePhoto);
      }
      imgGalleryRoom = null;
      Utils.loaderDialog(context, false);
      setState(() {});
    }
  }

  void textphotoRoom(int index) {
    setState(() {
      if (imgGalleryRoom == null) {
         toastShowError(context, 'Add Photo');
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Add Photo'),
        // ));
      } else {
        imgGalleryRoom = null;
      }
    });
  }

  void photocameraRoom(int index) {
    setState(() {
      if (imgCameraRoom == null) {
         toastShowError(context, 'Add description or Photo');
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Add description or Photo'),
        // ));
      } else {
        imgCameraRoom = null;
      }
    });
  }
}
