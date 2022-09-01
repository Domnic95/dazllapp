// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/component/loadingWidget.dart';
import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/realtor_project.dart';
import 'package:dazllapp/UI/homepage/realtor/Start_project/select_customer.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/app_theme.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Select_feature extends StatefulHookWidget {
  int? cutomerid;
  String? customeremail;
  Select_feature({
    this.cutomerid,
    this.customeremail,
    Key? key,
  }) : super(key: key);

  @override
  State<Select_feature> createState() => _Select_featureState();
}

class _Select_featureState extends State<Select_feature> {
  List<Map<String, dynamic>> listData = [];
  List<List<String>> FeatureissueName = [];
  List<List<int>> FeatureissueId = [];
  List<List<int>> featureissueId = [];
  List<List<bool>> featurebool = [];
  List<List<File>> imgFile = [];
  final imgPicker = ImagePicker();
  List<int> featureId = <int>[];
  List<int> featureoptionid = <int>[];
  List<String> currentoptionselected = <String>[];
  List<int> currenoptionselectedid = <int>[];
  List<int> select = [];
  List selectcheckbox = [];
  List<TextEditingController> _DescrptionController = [];
  List<TextEditingController> _PhotoDescrptionController = [];
  List<List<String>> _addphotodescription = [];
  int indexs = 0;
  List<String> _description = <String>[];
  bool loading = true;
  List<File> _file = [];

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    final _roomsfeature = context.read(customernotifier);
    await _roomsfeature.getRoomsFeature(roomid);
    await _roomsfeature.getFeatureOptionIssues();

    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      currentoptionselected.add('');
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      FeatureissueName.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      FeatureissueId.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      featureissueId.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      featurebool.add([]);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      currenoptionselectedid.add(0);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      featureId.add(0);
    }
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      featureoptionid.add(0);
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
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      _description.add('');
    }
    setState(() {
      loading = false;
    });
  }

  load() {
    for (int i = 0; i < featureId.length; i++) {
      Map<String, dynamic> _map = {
        "email": widget.customeremail,
        if (widget.customeremail == '')
          "realtor_id": SpHelpers.getString(SharedPrefsKeys.Realtor_id),
        "customer_id": widget.cutomerid,
        "featureOption": featureoptionid[i].toString(),
        "featureOptionIssues": FeatureissueId[i],
        "features": featureId[i].toString(),
        "inspectionNotes":
            //"test",
            _description[i].toString() != ''
                ? _description[i].toString()
                : "test",
        "issuetext": "test",
        "roomId": roomid
      };
      listData.add(_map);
    }
    setState(() {
      loading = true;
    });
  }

  images() {
    for (int i = 0; i < imgFile.length; i++) {
      for (int j = 0; j < imgFile[i].length; j++) {
        _file.add(imgFile[i][j]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _roomsfeature = useProvider(customernotifier);
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
                                            imgFile[index].clear();
                                            _addphotodescription[index].clear();
                                            featureId[index] = 0;
                                            featureoptionid[index] = 0;
                                            _description[index] = '';
                                            _DescrptionController[index]
                                                .clear();
                                            _PhotoDescrptionController[index]
                                                .clear();
                                            featurebool[index].clear();
                                            FeatureissueName[index].clear();
                                            FeatureissueId[index].clear();
                                            indexs = 0;
                                            // currentindex = index;
                                          } else {
                                            select.add(index);
                                            featureId[index] = _roomsfeature
                                                .listOfFeature[index].id;
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
                              select.contains(index)
                                  ? Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      //color: Colors.amber,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                        currenoptionselectedid[
                                                                index] =
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
                                                        currenoptionselectedid[
                                                            index];
                                                    featurebool[index].clear();
                                                    FeatureissueName[index]
                                                        .clear();
                                                    FeatureissueId[index]
                                                        .clear();

                                                    setState(() {});
                                                    await context
                                                        .read(customernotifier)
                                                        .getfeatureissue(
                                                            currenoptionselectedid[
                                                                index]);
                                                    for (int i = 0;
                                                        i <
                                                            _roomsfeature
                                                                .listOfissues
                                                                .length;
                                                        i++) {
                                                      featurebool[index]
                                                          .add(false);
                                                      FeatureissueName[index]
                                                          .add(_roomsfeature
                                                              .listOfissues[i]
                                                              .name);
                                                      featureissueId[index].add(
                                                          _roomsfeature
                                                              .listOfissues[i]
                                                              .id);
                                                    }
                                                  },
                                                ),
                                              ),
                                              currentoptionselected[index] != ''
                                                  ? Expanded(
                                                      // width: 160,
                                                      // height: 180,
                                                      child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            FeatureissueName[
                                                                    index]
                                                                .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int subindex) {
                                                          return CheckboxListTile(
                                                            title: Text(
                                                                FeatureissueName[
                                                                            index]
                                                                        [
                                                                        subindex]
                                                                    .toString()),
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .leading,
                                                            activeColor: AppTheme
                                                                .colorPrimary,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                featurebool[index]
                                                                        [
                                                                        subindex] =
                                                                    value!;
                                                                if (selectcheckbox.contains(
                                                                    featurebool[
                                                                            index]
                                                                        [
                                                                        subindex])) {
                                                                  selectcheckbox.remove(
                                                                      featurebool[
                                                                              index]
                                                                          [
                                                                          subindex]);
                                                                } else {
                                                                  selectcheckbox.add(
                                                                      featurebool[
                                                                              index]
                                                                          [
                                                                          subindex]);
                                                                }
                                                                if (featurebool[
                                                                            index]
                                                                        [
                                                                        subindex] ==
                                                                    true) {
                                                                  FeatureissueId[
                                                                          index]
                                                                      .add(featureissueId[
                                                                              index]
                                                                          [
                                                                          subindex]);
                                                                } else {
                                                                  FeatureissueId[
                                                                          index]
                                                                      .remove(featureissueId[
                                                                              index]
                                                                          [
                                                                          subindex]);
                                                                }
                                                                // log("sdsdw" +
                                                                //     FeatureissueId
                                                                //         .toString());
                                                                // log("sdsdw" +
                                                                //     featurebool
                                                                //         .toString());
                                                              });
                                                            },
                                                            value: featurebool[
                                                                    index]
                                                                [subindex],
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              featureoptionid[index] == 0
                                                  //  ||
                                                  //         featureissueid[index] == 0
                                                  ? ScaffoldMessenger.of(
                                                          context)
                                                      .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Select Option And issue'),
                                                    ))
                                                  : showOptionsDialog(
                                                      context, index);
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
                                            child: Stack(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _DescrptionController[
                                                          index],
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
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppTheme.colorPrimary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        _DescrptionController[
                                                                    index]
                                                                .text
                                                                .isEmpty
                                                            ? ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                content: Text(
                                                                    'Add description'),
                                                              ))
                                                            : _description[
                                                                    index] =
                                                                _DescrptionController[
                                                                        index]
                                                                    .text;
                                                        _DescrptionController[
                                                                index]
                                                            .clear();
                                                      },
                                                    ),
                                                    width: 50,
                                                  ),
                                                )
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
                              onTap: () async {
                                List<bool> desempty = [];
                                List<bool> featureissueempty = [];
                                // print("jkldn" + FeatureissueId.toString());
                                for (int i = 0; i < select.length; i++) {
                                  if (_description[select[i]].isEmpty) {
                                    desempty.add(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Add Description of ${_roomsfeature.listOfFeature[select[i]].name}')));
                                    break;
                                  } else {
                                    desempty.add(true);
                                  }
                                  if (FeatureissueId[select[i]].isEmpty) {
                                    featureissueempty.add(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Select issue ${_roomsfeature.listOfFeature[select[i]].name}')));
                                    break;
                                  } else {
                                    featureissueempty.add(true);
                                  }
                                }
                                if (!desempty.contains(false) &&
                                    !featureissueempty.contains(false)) {
                                  removeempty();
                                  load();
                                  images();
                                  final projectId = await context
                                      .read(realtorprovider)
                                      .createprojectrealtor(listData);
                                  await context
                                      .read(realtorprovider)
                                      .uploadimagesrealtor(projectId, _file);
                                  setState(() {
                                    loading = false;
                                  });

                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Realtor_project()));
                                }
                              },
                              child: FeatureissueId[indexs] == 0
                                  ? SizedBox()
                                  : Row(
                                      children: [
                                        Text(
                                          "Next",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 18,
                                                color:
                                                    lightColor.withOpacity(.9),
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
      }
    });
  }

  void removeempty() {
    featureId.removeWhere((element) => ["", 0].contains(element));
    featureoptionid.removeWhere((element) => ["", 0].contains(element));
    FeatureissueId.removeWhere((element) => element.length == 0);
    imgFile.removeWhere((element) => element.length == 0);
    _addphotodescription.removeWhere((element) => element.length == 0);
    _description.removeWhere((element) => ["", 0].contains(element));
  }
}
