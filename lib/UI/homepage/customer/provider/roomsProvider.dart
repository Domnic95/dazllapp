import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/homepage/customer/start_project/create_project.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class RoomProvider extends BaseNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  List<Room> _rooms = [];
  List<Room> get rooms => _rooms;
  bool _loading = true;
  bool get loading => _loading;
  List<List<List<bool>>> featurebool = [];
  List<List<List<File>>> imgFile = [];
  List<List<List<String>>> imagesList = [];
  final imgPicker = ImagePicker();
  List<List<int>> featureId = [];
  List<List<int>> featureoptionid = [];
  // List<List<String>> currentoptionselected = [];
  List<List<int>> currenoptionselectedid = [];
  List<List<int>> select = [];
  List<List> selectcheckbox = [];
  List<List<TextEditingController>> _DescrptionController = [];
  List<List<TextEditingController>> get DescrptionController =>
      _DescrptionController;
  // List<List<TextEditingController>> _PhotoDescrptionController = [];
  List<List<String>> _description = [];
  List<List<String>> get description => _description;
  List<Map<String, dynamic>> listData = [];
  List<File> _file = [];
  List<File> get file => _file;
  List<int> _roomIdList = [];
  List<int> get roomIdList => _roomIdList;
  List<bool> isSet = [];
  void init({required int roomid, required CustomerNotifier roomsNotifier}) {
    final room =
        roomsNotifier.listOfRoom.where((element) => element.id == roomid);
    _rooms.add(room.first);
    _roomIdList.add(roomid);
    // log("asjflsfldslk===   $roomIdList");
    featureId.add([]);
    featurebool.add([]);
    imgFile.add([]);
    imagesList.add([]);
    featureoptionid.add([]);
    select.add([]);
    selectcheckbox.add([]);
    _DescrptionController.add([]);
    _description.add([]);
    isSet.add(false);
  }

  set(bool value, int index) {
    isSet[index] = value;
    notifyListeners();
  }

  void setTabIndex({required int tabIndex}) {
    _tabIndex = tabIndex;
    notifyListeners();
  }

  Future getImage(BuildContext context, int tabIndex, int index, int k) async {
    String img = await context
        .read(realtorprovider)
        .uploadImage(context, imgFile[tabIndex][index][k]);
    imagesList[tabIndex][index].add(img);
    // imgFile[_tabIndex][index].add(File(path));
    log("mage == $imagesList");
  }

  void removeempty() {
    // _Descrption.removeWhere((element) => ["", 0].contains(element));
    imgFile.removeWhere((element) => element.length == 0);
    // widget.addphotodescription.removeWhere((element) => element.length == 0);
  }

  reset() {
    isSet.clear();
    _rooms.clear();
    featurebool.clear();
    // currenoptionselectedid.add(0);
    featureId.clear();
    DescrptionController.clear();
    description.clear();
    // featureoptionid.add(0);
    // _PhotoDescrptionController.add(TextEditingController());
    imgFile.clear();
    imagesList.clear();

    _DescrptionController.clear();
    currenoptionselectedid.clear();
    select.clear();
    selectcheckbox.clear();
    _roomIdList.clear();
    // log("asjflsfldslk===   $roomIdList");
    featureId.clear();
    featurebool.clear();
    featureoptionid.clear();

    _description.clear();
  }

  loaddata(BuildContext context) async {
    final _roomsfeature = context.read(customernotifier);
    await _roomsfeature.getRoomsFeature(roomid);
    await _roomsfeature.getFeatureOptionIssues();

    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      // currentoptionselected[tabIndex].add('');
      featurebool[tabIndex].add([]);
      // currenoptionselectedid.add(0);
      featureId[tabIndex].add(0);
      DescrptionController[tabIndex].add(TextEditingController());
      description[tabIndex].add('');
      // featureoptionid.add(0);
      // _PhotoDescrptionController.add(TextEditingController());
      imgFile[tabIndex].add([]);
      imagesList[tabIndex].add([]);
    }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   FeatureissueName.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   FeatureissueId.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   featureissueId.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   featurebool.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   currenoptionselectedid.add(0);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   featureId.add(0);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   featureoptionid.add(0);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   _addphotodescription.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   _DescrptionController.add(TextEditingController());
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   _PhotoDescrptionController.add(TextEditingController());
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   imgFile.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   _addphotodescription.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   _description.add('');
    // }
    // setState(() {
    _loading = false;
    // });
    notifyListeners();
  }

  void addRoom({required int roomid, required CustomerNotifier roomsNotifier}) {
    final room =
        roomsNotifier.listOfRoom.where((element) => element.id == roomid);
    _rooms.add(room.first);
    featureId.add([]);
    featurebool.add([]);
    imgFile.add([]);
    imagesList.add([]);
    featureoptionid.add([]);
    select.add([]);
    selectcheckbox.add([]);
    _DescrptionController.add([]);
    _description.add([]);
    notifyListeners();
  }

  images(int i) {
    _file.clear();
    // for (int i = 0; i < imgFile.length; i++) {
    for (int j = 0; j < imgFile[i].length; j++) {
      for (int k = 0; k < imgFile[i][j].length; k++) {
        _file.add(imgFile[i][j][k]);
      }
    }
    // }
  }

  load(int i) {
    listData.clear();
    if (featureId[i].length != 0) {
      for (int j = 0; j < featureId[i].length; j++) {
        if (featureId[i][j] != 0 &&
            DescrptionController[i][j].text.isNotEmpty) {
          Map<String, dynamic> _map = {
            "featureOption": "",
            "featureOptionIssues": [],
            "features": featureId[i][j].toString(),
            "inspectionNotes":
                //"test",
                DescrptionController[i][j].text.toString() != ''
                    ? DescrptionController[i][j].text.toString()
                    : "test",
            "issuetext": "test",
            "roomId": _roomIdList[i],
            "images": imagesList[i][j],
            "imageDesc": [],
          };
          listData.add(_map);
          log("listData == $listData");
        }
      }
    }

    // setState(() {
    //   loading = true;
    // });
  }
}