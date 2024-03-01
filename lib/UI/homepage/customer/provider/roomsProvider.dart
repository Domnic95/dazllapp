// import 'dart:developer';
// import 'dart:io';

// import 'package:dazllapp/config/providers/base_notifier.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/model/Customer/Features.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// class RoomProvider extends BaseNotifier {
//   // bool tempclick = true;
//   int _tabIndex = 0;
//   int get tabIndex => _tabIndex;
//   List<Room> _rooms = [];
//   List<Room> get rooms => _rooms;
//   bool _loading = true;
//   bool get loading => _loading;
//   List<List<List<bool>>> featurebool = [];
//   List<List<List<File>>> imgFile = [];
//   List<List<List<String>>> imagesList = [];
//   final imgPicker = ImagePicker();
//   List<List<int>> featureId = [];
//   List<List<int>> featureoptionid = [];
//   // List<List<String>> currentoptionselected = [];
//   List<List<int>> currenoptionselectedid = [];
//   List<List<int>> select = [];
//   List<List> selectcheckbox = [];
//   List<List<TextEditingController>> _DescrptionController = [];
//   List<List<TextEditingController>> get DescrptionController =>
//       _DescrptionController;
//   // List<List<TextEditingController>> _PhotoDescrptionController = [];
//   List<List<String>> _description = [];
//   List<List<String>> get description => _description;
//   List<Map<String, dynamic>> listData = [];
//   List<File> _file = [];
//   List<File> get file => _file;
//   List<int> _roomIdList = [];
//   List<int> get roomIdList => _roomIdList;
//   List<bool> isSet = [];

//   List<List<RoomFeature>> listOfFeature = [];
//   void init({required int roomid, required CustomerNotifier roomsNotifier}) {
//     log("init");
//     final room =
//         roomsNotifier.listOfRoom.where((element) => element.id == roomid);
//     _rooms.insert(0, room.first);
//     _roomIdList.insert(0, roomid);
//     // log("asjflsfldslk===   $roomIdList");
//     featureId.insert(0, []);
//     featurebool.insert(0, []);
//     imgFile.insert(0, []);
//     imagesList.insert(0, []);
//     featureoptionid.insert(0, []);
//     select.insert(0, []);
//     selectcheckbox.insert(0, []);
//     _DescrptionController.insert(0, []);
//     _description.insert(0, []);
//     isSet.insert(0, false);
//   }

//   set(bool value, int index) {
//     isSet[index] = value;
//     notifyListeners();
//   }

//   void setTabIndex({required int tabIndex}) {
//     _tabIndex = tabIndex;
//     notifyListeners();
//   }

//   Future getImage(BuildContext context, int tabIndex, int index, File image,
//       WidgetRef ref) async {
//     String img = await ref.read(realtorprovider).uploadImage(context, image);
//     imagesList[tabIndex][index].add(img);
//     // imgFile[_tabIndex][index].add(File(path));
//     log("mage == $imagesList");
//   }

//   void removeempty() {
//     // _Descrption.removeWhere((element) => ["", 0].contains(element));
//     imgFile.removeWhere((element) => element.length == 0);
//     // widget.addphotodescription.removeWhere((element) => element.length == 0);
//   }

//   reset() {
//     _tabIndex = 0;
//     isSet.clear();
//     _rooms.clear();
//     featurebool.clear();
//     // currenoptionselectedid.add(0);

//     DescrptionController.clear();
//     description.clear();
//     // featureoptionid.add(0);
//     // _PhotoDescrptionController.add(TextEditingController());
//     imgFile.clear();
//     imagesList.clear();
//     listOfFeature.clear();
//     _DescrptionController.clear();
//     currenoptionselectedid.clear();
//     select.clear();
//     selectcheckbox.clear();
//     _roomIdList.clear();
//     // log("asjflsfldslk===   $roomIdList");
//     featureId.clear();
//     featurebool.clear();
//     featureoptionid.clear();

//     _description.clear();
//   }

//   loaddata(BuildContext context, int roomid, WidgetRef ref) async {
//     _loading = true;
//     log('loaddata');
//     final _roomsfeature = ref.read(customernotifier);
//     await _roomsfeature.getRoomsFeature(roomid);
//     await _roomsfeature.getFeatureOptionIssues();
//     listOfFeature.insert(0, _roomsfeature.listOfFeature);
//     for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
//       // currentoptionselected[tabIndex].add('');
//       featurebool[0].insert(0, []);
//       // currenoptionselectedid.add(0);
//       featureId[0].insert(0, 0);
//       DescrptionController[0].insert(0, TextEditingController());
//       description[0].insert(0, '');
//       // featureoptionid.add(0);
//       // _PhotoDescrptionController.add(TextEditingController());
//       imgFile[0].insert(0, []);
//       imagesList[0].insert(0, []);
//     }
//     _loading = false;
//     notifyListeners();
//   }

//   void addRoom({required int roomid, required CustomerNotifier roomsNotifier}) {
//     final room =
//         roomsNotifier.listOfRoom.where((element) => element.id == roomid);
//     _rooms.insert(0, room.first);
//     featureId.insert(0, []);
//     featurebool.insert(0, []);
//     imgFile.insert(0, []);
//     imagesList.insert(0, []);
//     featureoptionid.insert(0, []);
//     select.insert(0, []);
//     selectcheckbox.insert(0, []);
//     _DescrptionController.insert(0, []);
//     _description.insert(0, []);
//     notifyListeners();
//   }

//   images(int i) {
//     // _file.clear();
//     // for (int i = 0; i < imgFile.length; i++) {
//     for (int j = 0; j < imgFile[i].length; j++) {
//       for (int k = 0; k < imgFile[i][j].length; k++) {
//         _file.add(imgFile[i][j][k]);
//       }
//     }
//     // }
//   }

//   onSelect(index) {
//     if (select[tabIndex].contains(index)) {
//       select[tabIndex].remove(index);
//       // currentoptionselected[index] = '';
//       imgFile[tabIndex][index].clear();
//       // _addphotodescription[index].clear();
//       featureId[tabIndex][index] = 0;
//       // featureoptionid[index] = 0;
//       description[tabIndex][index] = '';
//       DescrptionController[tabIndex][index].clear();
//       // _PhotoDescrptionController[index]
//       //     .clear();
//       featurebool[tabIndex][index].clear();
//       // FeatureissueName[index].clear();
//       // FeatureissueId[index].clear();
//       // currentindex = index;
//     } else {
//       select[tabIndex].add(index);
//       // log("dnskgfkdjjkdkj === ${_roomProvider.featureId[_roomProvider.tabIndex]}");
//       // log("dnskgfkdjjkdkj === ${_roomProvider.listOfFeature[_roomProvider.tabIndex]}");
//       featureId[tabIndex][index] = listOfFeature[tabIndex][index].id;
//     }
//     notifyListeners();
//   }

//   load(int i) {
//     // listData.clear();
//     if (featureId[i].length != 0) {
//       for (int j = 0; j < featureId[i].length; j++) {
//         if (featureId[i][j] != 0) {
//           Map<String, dynamic> _map = {
//             "featureOption": "",
//             "featureOptionIssues": [],
//             "features": featureId[i][j],
//             // "inspectionNotes":
//             //     //"test",
//             //     DescrptionController[i][j].text.toString() != ''
//             //         ? DescrptionController[i][j].text.toString()
//             //         : "test",
//             "issuetext": "test",
//             "roomId": _roomIdList[i],
//             "images": imagesList[i][j],
//             "imageDesc": [],
//           };
//           if (DescrptionController[i][j].text.isNotEmpty) {
//             _map["inspectionNotes"] =
//                 DescrptionController[i][j].text.toString();
//           }
//           listData.add(_map);
//         }
//       }
//     }

//     // setState(() {
//     //   loading = true;
//     // });
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/homepage/customer/model/selectedFeature_model.dart';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/model/Customer/Features.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class RoomProvider extends BaseNotifier {
  Room? selectedRoom;
  List<Room> selectedAllRooms = [];
  List<List<RoomFeature>> allRoomFeature = [];
  bool isLoading = true;
  bool addNewDataLoading = true;
  final imgPicker = ImagePicker();
  bool dataListItemIsEmpty = false;
  List<Map<String, dynamic>> allData = [];
  int tabIndex = 0;
  int roomId = -1;

  setRoomFeatureData({required int roomId, required int tabIndex}) async {
    final res = await dioClient.getRequest(
      apiEnd: roomsfeature + roomId.toString(),
    );
    List<RoomFeature> newRoomFeature = List<RoomFeature>.from(
        res.data["data"].map((x) => RoomFeature.fromJson(x)));

    allRoomFeature.insert(tabIndex, newRoomFeature);
    for (var i = 0; i < allRoomFeature[tabIndex].length; i++) {
      allRoomFeature[tabIndex][i].selectedFeatureForOneTabs =
          SelectedFeatureModel(
              roomId: -1,
              featureId: -1,
              checkBox: false,
              descrptionController: TextEditingController(),
              images: []);
    }
  }

  addSeletedRoom({required Room addRoom, required int tabIndex}) async {
    addNewDataLoading = true;
    changeLoadingState(value: true);
    selectedAllRooms.insert(0, addRoom);
    await setRoomFeatureData(roomId: addRoom.id, tabIndex: tabIndex);
    addNewDataLoading = false;
    changeLoadingState(value: false);
  }

  Future<String> getImage(
      BuildContext context, File image, WidgetRef ref) async {
    String img = await ref.read(realtorprovider).uploadImage(context, image);
    return img;
  }

  changeCheckBox(
      {required tabIndex,
      required selectedFeatureIndex,
      required bool value,
      required int setFeatureId}) {
    allRoomFeature[tabIndex][selectedFeatureIndex]
        .selectedFeatureForOneTabs
        .checkBox = value;
    if (value) {
      allRoomFeature[tabIndex][selectedFeatureIndex]
          .selectedFeatureForOneTabs
          .featureId = setFeatureId;
      allRoomFeature[tabIndex][selectedFeatureIndex]
          .selectedFeatureForOneTabs
          .roomId = selectedRoom!.id;
    } else {
      allRoomFeature[tabIndex][selectedFeatureIndex].selectedFeatureForOneTabs =
          SelectedFeatureModel(
              roomId: -1,
              featureId: -1,
              checkBox: false,
              descrptionController: TextEditingController(),
              images: []);
    }
    notifyListeners();
  }

  changeLoadingState({required bool value}) {
    isLoading = value;
    if (value == false) notifyListeners();
  }

  changeTabIndex({required int newTabIndex}) {
    tabIndex = newTabIndex;
    notifyListeners();
  }

  load() {
    dataListItemIsEmpty = false;

    for (var i = 0; i < allRoomFeature.length; i++) {
      List<bool> checkBoxCheking = [];
      for (var j = 0; j < allRoomFeature[i].length; j++) {
        SelectedFeatureModel itemModel =
            allRoomFeature[i][j].selectedFeatureForOneTabs;
        if (itemModel.checkBox) {
          checkBoxCheking.add(true);
          if (itemModel.descrptionController.text.isNotEmpty &&
              itemModel.images.isNotEmpty) {
            allData.add({
              "featureOption": "",
              "featureOptionIssues": [],
              "features":
                  allRoomFeature[i][j].selectedFeatureForOneTabs.featureId,
              // "inspectionNotes":
              //     //"test",
              //     DescrptionController[i][j].text.toString() != ''
              //         ? DescrptionController[i][j].text.toString()
              //         : "test",
              "issuetext": "test",
              "roomId": allRoomFeature[i][j].selectedFeatureForOneTabs.roomId,
              "images": allRoomFeature[i][j].selectedFeatureForOneTabs.images,
              "imageDesc": [],
              if (allRoomFeature[i][j]
                  .selectedFeatureForOneTabs
                  .descrptionController
                  .text
                  .isNotEmpty)
                "inspectionNotes": allRoomFeature[i][j]
                    .selectedFeatureForOneTabs
                    .descrptionController
                    .text
                    .toString()
            });
          } else {
            dataListItemIsEmpty = true;
            allData = [];
            notifyListeners();
            break;
          }
        } else {
          checkBoxCheking.add(false);
        }
      }
      if (!checkBoxCheking.contains(true)) {
        dataListItemIsEmpty = true;
        allData = [];
        notifyListeners();
        break;
      }
    }
  }

  void restartProject() {
    selectedRoom = null;
    selectedAllRooms = [];
    allRoomFeature = [];
    isLoading = true;
    dataListItemIsEmpty = false;
    allData = [];
    notifyListeners();
  }

  Future<int> createproject() async {
    Response res =
        await dioClient.rawwithFormData(apiEnd: create_projet, Data: allData);

    log("sjljlflzs === " + res.toString());
    log("sjljlflzs === data " + allData.toString());
    if (res.statusCode == 200) {
      restartProject();
    }
    return res.data['project_id'];
  }
}
