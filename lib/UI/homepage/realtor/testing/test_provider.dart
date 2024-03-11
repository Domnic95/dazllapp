// import 'dart:developer';
// import 'dart:io';

// import 'package:dazllapp/UI/homepage/customer/model/selectedFeature_model.dart';
// import 'package:dazllapp/config/api.dart';
// import 'package:dazllapp/config/providers/base_notifier.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/constant/spkeys.dart';
// import 'package:dazllapp/model/Customer/Features.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// class TestProvider extends BaseNotifier {
//   Room? selectedRoom;
//   List<Room> selectedAllRooms = [];
//   List<List<RoomFeature>> allRoomFeature = [];
//   bool isLoading = true;
//   bool addNewDataLoading = true;
//   final imgPicker = ImagePicker();
//   bool dataListItemIsEmpty = false;
//   List<Map<String, dynamic>> allData = [];
//   int tabIndex = 0;
//   int roomId = -1;

//   setRoomFeatureData({required int roomId, required int tabIndex}) async {
//     final res = await dioClient.getRequest(
//       apiEnd: roomsfeature + roomId.toString(),
//     );
//     List<RoomFeature> newRoomFeature = List<RoomFeature>.from(
//         res.data["data"].map((x) => RoomFeature.fromJson(x)));

//     allRoomFeature.insert(tabIndex, newRoomFeature);
//     for (var i = 0; i < allRoomFeature[tabIndex].length; i++) {
//       allRoomFeature[tabIndex][i].selectedFeatureForOneTabs =
//           SelectedFeatureModel(
//               roomId: -1,
//               featureId: -1,
//               checkBox: false,
//               descrptionController: TextEditingController(),
//               images: []);
//     }
//   }

//   addSeletedRoom({required Room addRoom, required int tabIndex}) async {
//     addNewDataLoading = true;
//     changeLoadingState(value: true);
//     selectedAllRooms.insert(0, addRoom);
//     await setRoomFeatureData(roomId: addRoom.id, tabIndex: tabIndex);
//     addNewDataLoading = false;
//     changeLoadingState(value: false);
//   }

//   Future<String> getImage(
//       BuildContext context, File image, WidgetRef ref) async {
//     String img = await ref.read(realtorprovider).uploadImage(context, image);
//     return img;
//   }

//   changeCheckBox(
//       {required tabIndex,
//       required selectedFeatureIndex,
//       required bool value,
//       required int setFeatureId}) {
//     allRoomFeature[tabIndex][selectedFeatureIndex]
//         .selectedFeatureForOneTabs
//         .checkBox = value;
//     if (value) {
//       allRoomFeature[tabIndex][selectedFeatureIndex]
//           .selectedFeatureForOneTabs
//           .featureId = setFeatureId;
//       allRoomFeature[tabIndex][selectedFeatureIndex]
//           .selectedFeatureForOneTabs
//           .roomId = selectedRoom!.id;
//     } else {
//       allRoomFeature[tabIndex][selectedFeatureIndex].selectedFeatureForOneTabs =
//           SelectedFeatureModel(
//               roomId: -1,
//               featureId: -1,
//               checkBox: false,
//               descrptionController: TextEditingController(),
//               images: []);
//     }
//     notifyListeners();
//   }

//   changeLoadingState({required bool value}) {
//     isLoading = value;
//     if (value == false) notifyListeners();
//   }

//   changeTabIndex({required int newTabIndex}) {
//     tabIndex = newTabIndex;
//     notifyListeners();
//   }

//   loadData() {
//     dataListItemIsEmpty = false;

//     for (var i = 0; i < allRoomFeature.length; i++) {
//       List<bool> checkBoxCheking = [];
//       for (var j = 0; j < allRoomFeature[i].length; j++) {
//         SelectedFeatureModel itemModel =
//             allRoomFeature[i][j].selectedFeatureForOneTabs;
//         if (itemModel.checkBox) {
//           checkBoxCheking.add(true);
//           if (itemModel.descrptionController.text.isNotEmpty &&
//               itemModel.images.isNotEmpty) {
//             allData.add({
//               "realtor_id": SpHelpers.getString(SharedPrefsKeys.Realtor_id),
//               "featureOption": "",
//               "featureOptionIssues": [],
//               "features":
//                   allRoomFeature[i][j].selectedFeatureForOneTabs.featureId,
//               // "inspectionNotes":
//               //     //"test",
//               //     DescrptionController[i][j].text.toString() != ''
//               //         ? DescrptionController[i][j].text.toString()
//               //         : "test",
//               "issuetext": "test",
//               "roomId": allRoomFeature[i][j].selectedFeatureForOneTabs.roomId,
//               "images": allRoomFeature[i][j].selectedFeatureForOneTabs.images,
//               "imageDesc": [],
//               if (allRoomFeature[i][j]
//                   .selectedFeatureForOneTabs
//                   .descrptionController
//                   .text
//                   .isNotEmpty)
//                 "inspectionNotes": allRoomFeature[i][j]
//                     .selectedFeatureForOneTabs
//                     .descrptionController
//                     .text
//                     .toString()
//             });
//           } else {
//             dataListItemIsEmpty = true;
//             allData = [];
//             notifyListeners();
//             break;
//           }
//         } else {
//           checkBoxCheking.add(false);
//         }
//       }
//       if (!checkBoxCheking.contains(true)) {
//         dataListItemIsEmpty = true;
//         allData = [];
//         notifyListeners();
//         break;
//       }
//     }
//   }

//   void restartProject() {
//     selectedRoom = null;
//     selectedAllRooms = [];
//     allRoomFeature = [];
//     isLoading = true;
//     dataListItemIsEmpty = false;
//     allData = [];
//     notifyListeners();
//   }

//   Future<int> createproject() async {
//     Response res = await dioClient.rawwithFormData(
//         apiEnd: create_project_realtor, Data: allData);

//     log("sjljlflzs === " + res.toString());
//     log("sjljlflzs === data " + allData.toString());
//     if (res.statusCode == 200) {
//       restartProject();
//     }
//     return res.data['project_id'];
//   }
// }
