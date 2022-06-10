// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_if_null_operators, prefer_typing_uninitialized_variables, sized_box_for_whitespace, unnecessary_null_comparison, unused_import, unnecessary_import, use_key_in_widget_constructors, non_constant_identifier_names, prefer_final_fields, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/component/edit_field.dart';
import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/tell_us_more.dart';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class NeedAttention extends StatefulHookWidget {
  @override
  _NeedAttentionState createState() => _NeedAttentionState();
}

class _NeedAttentionState extends State<NeedAttention> {
  List<List<File>> imgFile = [];
  List<File> selectphoto = [];
  File? file;
  final imgPicker = ImagePicker();
  List<int> featureId = <int>[];
  List<int> featureoptionid = <int>[];
  List<String> currentoptionselected = <String>[];
  List<int> currentoptionselectedid = <int>[];
  List<String> currentissueselected = <String>[];
  List<int> c = <int>[];
  List<int> select = [];
  List<TextEditingController> _DescrptionController = [];
  List<TextEditingController> _PhotoDescrptionController = [];
  List<List<String>> _addphotodescription = [];
  // List<Widget> _addphoto = [];
  int indexs = 0;
  bool loading = true;
  bool view = true;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    final _roomsfeature = context.read(roomsprovider);
    await _roomsfeature.getRoomsFeature(roomid);
    await _roomsfeature.getFeatureOptionIssues();

    // print('loadta Length = ${_roomsfeature.listOfFeature.length}');
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      currentoptionselected.add('');
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      c.add(0);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      featureId.add(0);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      featureoptionid.add(0);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      currentissueselected.add('');
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      _addphotodescription.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      _DescrptionController.add(TextEditingController());
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      _PhotoDescrptionController.add(TextEditingController());
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      imgFile.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      _addphotodescription.add([]);
    }
    setState(() {
      loading = false;
    });
  }

  // bool view = false;

  @override
  Widget build(BuildContext context) {
    final _roomsfeature = useProvider(roomsprovider);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: loading
          ? LoadingWidget()
          : Scaffold(
              body: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "What items in this room would you like to dazl up ?",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 12,
                                    color: lightColor.withOpacity(.9),
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Expanded(
                      // height: size.height * 0.63,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: _roomsfeature.listOfFeature.length,
                        separatorBuilder: (BuildContext context, int index) {
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
                                      value: select.contains(index),
                                      onChanged: (val) {
                                        setState(() {
                                          if (select.contains(index)) {
                                            select.remove(index);
                                            currentoptionselected[index] = '';
                                            currentissueselected[index] = '';
                                            imgFile[index].clear();
                                            _addphotodescription[index].clear();
                                            _DescrptionController[index]
                                                .clear();
                                            _PhotoDescrptionController[index]
                                                .clear();
                                            // currentindex = index;
                                          } else {
                                            select.add(index);
                                            featureId[index] = _roomsfeature
                                                .listOfFeature[index].id;
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
                              select.contains(index)
                                  ? Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      //color: Colors.amber,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                currentoptionselected[index] !=
                                                        ''
                                                    ? MainAxisAlignment
                                                        .spaceAround
                                                    : MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: size.width / 2.3,
                                                decoration: BoxDecoration(
                                                    // color: Colors.blue,
                                                    // borderRadius:
                                                    //     BorderRadius.circular(20)
                                                    ),
                                                child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  hint: currentoptionselected[
                                                              index] ==
                                                          ''
                                                      ? Text('Select Option')
                                                      : Text(
                                                          currentoptionselected[
                                                              index]),
                                                  items: _roomsfeature
                                                      .listOfoption
                                                      .where((c) =>
                                                          c.featureId ==
                                                          featureId[index])
                                                      .map((dropdownselect) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      child: Text(
                                                          dropdownselect.name),
                                                      value:
                                                          dropdownselect.name,
                                                      onTap: () {
                                                        c[index] =
                                                            dropdownselect.id;
                                                      },
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (newselectedvalue) async {
                                                    currentoptionselected[
                                                            index] =
                                                        newselectedvalue!;
                                                    featureoptionid[index] =
                                                        c[index];
                                                    indexs = index;
                                                    currentoptionselectedid
                                                        .add(c[index]);

                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                              currentoptionselected[index] != ''
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          width:
                                                              size.width / 2.3,
                                                          decoration: BoxDecoration(
                                                              // color: Colors.red,
                                                              // borderRadius:
                                                              //     BorderRadius.circular(20)
                                                              ),
                                                          child: DropdownButton<
                                                              String>(
                                                            isExpanded: true,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            hint: currentissueselected[
                                                                        index] ==
                                                                    ''
                                                                ? Text(
                                                                    'Select issue')
                                                                : Text(
                                                                    currentissueselected[
                                                                        index]),
                                                            items: _roomsfeature
                                                                .listOfissues
                                                                .where((e) =>
                                                                    e.featureOptionId ==
                                                                    c[index])
                                                                .map(
                                                                    (dropdownselect) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                child: Text(
                                                                    dropdownselect
                                                                        .name),
                                                                value:
                                                                    dropdownselect
                                                                        .name,
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newselectedvalue) {
                                                              currentissueselected[
                                                                      index] =
                                                                  newselectedvalue!;
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showOptionsDialog(context, index);
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 7,
                                                          bottom: 7,
                                                          left: 12,
                                                          right: 12),
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .colorPrimary
                                                              .withOpacity(0.4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Text('+ Photos')),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 7),
                                                      height:
                                                          size.height * 0.05,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppTheme
                                                                  .grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: Colors.white),
                                                      child: TextFormField(
                                                        controller:
                                                            _PhotoDescrptionController[
                                                                index],
                                                        // textInputAction:
                                                        //     TextInputAction.done,
                                                        cursorColor: AppTheme
                                                            .colorPrimary,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "Add Photo Description",
                                                            hintStyle: TextStyle(
                                                                fontSize: 14),
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
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 18,
                                                    backgroundColor: AppTheme
                                                        .colorPrimary
                                                        .withOpacity(0.6),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          if (imgGallery !=
                                                              null) {
                                                            textphoto(index);
                                                          }
                                                          if (imgCamera !=
                                                              null) {
                                                            photocamera(index);
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.send,
                                                          color: Colors.white,
                                                          size: 18,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          imgFile[index] == null ||
                                                  imgFile[index].toString() ==
                                                      File('').toString()
                                              ? SizedBox()
                                              : ListView.separated(
                                                  separatorBuilder:
                                                      (context, subIndex) {
                                                    return SizedBox(
                                                      height: 10,
                                                    );
                                                  },
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      imgFile[index].length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int subIndex) {
                                                    return imgFile[index][
                                                                    subIndex] ==
                                                                File('') ||
                                                            _addphotodescription[
                                                                        index][
                                                                    subIndex] ==
                                                                ''
                                                        ? SizedBox()
                                                        : ListTile(
                                                            leading: Container(
                                                              height: 60,
                                                              width: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image:
                                                                      FileImage(
                                                                    imgFile[index]
                                                                        [
                                                                        subIndex],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            title: _addphotodescription[
                                                                        subIndex] ==
                                                                    ''
                                                                ? Text('')
                                                                : Text(_addphotodescription[
                                                                        index]
                                                                    [subIndex]),
                                                            trailing:
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        imgFile[index]
                                                                            .removeAt(subIndex);
                                                                        _addphotodescription[index]
                                                                            .removeAt(subIndex);
                                                                      });
                                                                      log(_addphotodescription
                                                                          .toString());
                                                                      log(imgFile
                                                                          .toString());
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      size: 20,
                                                                    )),
                                                          );
                                                  },
                                                ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: size.height * 0.12,
                                            padding: EdgeInsets.only(left: 15),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppTheme.grey
                                                        .withOpacity(0.5),
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: TextFormField(
                                              controller:
                                                  _DescrptionController[index],
                                              minLines: 2,
                                              maxLines: 100,
                                              textInputAction:
                                                  TextInputAction.done,
                                              cursorColor:
                                                  AppTheme.colorPrimary,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Add note to inspection report",
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent))),
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 18,
                                          color: lightColor.withOpacity(.9),
                                        ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              // onTap: () {
                              //   Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //       builder: (context) => TellusMore(
                              //         currentoptionselected:
                              //             currentoptionselected,
                              //         currentissueselected:
                              //             currentissueselected,
                              //         imgFile: imgFile,
                              //         DescrptionController:
                              //             _DescrptionController,
                              //       ),
                              //     ),
                              //   );
                              // },
                              child: Row(
                                children: [
                                  Text(
                                    "Next",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> showOptionsDialog(
    BuildContext context,
    index,
  ) {
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
                      openCamera(
                        index,
                      );
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
                      openGallery(
                        index,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  late var imgCamera;
  void openCamera(
    int index,
  ) async {
    imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    Navigator.of(context).pop();
  }

  late var imgGallery;
  void openGallery(
    int index,
  ) async {
    imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    Navigator.of(context).pop();
  }

  void textphoto(int index) {
    setState(() {
      if (_PhotoDescrptionController[index].text.isEmpty ||
          imgGallery == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add description or Photo'),
        ));
      } else {
        _addphotodescription[index].add(_PhotoDescrptionController[index].text);
        imgFile[index].add(File(imgGallery.path));
        _PhotoDescrptionController[index].clear();
        imgGallery = null;
        log(imgGallery.toString());
        log(imgFile.toString());
        log(_addphotodescription.toString());
      }
    });
  }

  void photocamera(int index) {
    setState(() {
      if (_PhotoDescrptionController[index].text.isEmpty || imgCamera == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add description or Photo'),
        ));
      } else {
        _addphotodescription[index].add(_PhotoDescrptionController[index].text);
        imgFile[index].add(File(imgCamera.path));
        _PhotoDescrptionController[index].clear();
        imgCamera = null;
        log(imgCamera.toString());
        log(imgFile.toString());
        log(_addphotodescription.toString());
      }
    });
  }
}

// floatingActionButton: Padding(
//   padding:
//       EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 14),
//   child: Align(
//     alignment: Alignment.bottomRight,
//     child: FloatingActionButton.extended(
//       onPressed: () {
//         setState(() {
//           view = true;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             elevation: 0.3,
//             backgroundColor: Colors.transparent,
//             dismissDirection: DismissDirection.none,
//             duration: Duration(days: 5),
//             content: Column(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       ScaffoldMessenger.of(context)
//                           .hideCurrentSnackBar();
//                       setState(() {
//                         view = false;
//                       });
//                     },
//                     child: Container(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 30),
//                   height: size.height * 0.12,
//                   padding: EdgeInsets.only(left: 15),
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: AppTheme.grey.withOpacity(0.5),
//                           width: 2),
//                       // boxShadow: [
//                       //   BoxShadow(
//                       //       color: AppTheme.grey.withOpacity(0.3),
//                       //       blurRadius: 3,
//                       //       spreadRadius: 1,
//                       //       offset: Offset(3, 3))
//                       // ],
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white),
//                   child: Stack(
//                     children: [
//                       TextFormField(
//                         controller: _Attentioncontroller,
//                         minLines: 2,
//                         maxLines: 100,
//                         textInputAction: TextInputAction.done,
//                         cursorColor: AppTheme.colorPrimary,
//                         decoration: InputDecoration(
//                             hintText: "Add note to inspection report",
//                             hintStyle:
//                                 Theme.of(context).textTheme.bodyText1,
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.transparent)),
//                             enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.transparent)),
//                             border: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.transparent))),
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: AppTheme.colorPrimary,
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(10),
//                                   topLeft: Radius.circular(10))),
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.arrow_forward_ios,
//                               color: Colors.white,
//                             ),
//                             onPressed: () {
//                               ScaffoldMessenger.of(context)
//                                   .hideCurrentSnackBar();
//                               setState(() {
//                                 view = false;
//                               });
//                             },
//                           ),
//                           width: 50,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )));
//       },
//       backgroundColor: view == true
//           ? Colors.transparent.withOpacity(0)
//           : AppTheme.colorPrimary,
//       elevation: 0,
//       label: Text(
//         'Want to Add Comment?',
//         style: TextStyle(
//             fontSize: MediaQuery.of(context).size.height / 55),
//       ),
//     ),
//   ),
// ),
//  resizeToAvoidBottomInset: false,
// appBar: AppBar(
//   leading: Container(),
//   elevation: 0,
// ),
