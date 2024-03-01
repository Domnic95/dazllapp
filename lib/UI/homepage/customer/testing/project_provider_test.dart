// import 'dart:developer';
// import 'dart:io';

// import 'package:dazllapp/config/api.dart';
// import 'package:dazllapp/config/providers/base_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/model/Customer/Features.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileTestProvider extends BaseNotifier {
//   bool roomDataLoading = false;
//   Room? selectedRoom;
//   List<Room> selectedAllRooms = [];
//   List<List<RoomFeature>> allRoomFeature = [];
//   bool isLoading = true;
//   final imgPicker = ImagePicker();
//   bool dataListItemIsEmpty = false;
//   List<Map<String, dynamic>> allData = [];
//   int tabIndex = 0;

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
//     notifyListeners();
//   }

//   addSeletedRoom({required Room addRoom, required int tabIndex}) async {
//     changeLoadingState(value: true);
//     selectedAllRooms.insert(0,addRoom);
//     await setRoomFeatureData(roomId: addRoom.id, tabIndex: tabIndex);
//     changeLoadingState(value: false);
//   }

//   void changeRoomDataLoading({required bool value}) {
//     roomDataLoading = value;
//     notifyListeners();
//   }

//   Future<String> getImage(
//       BuildContext context, File image, WidgetRef ref) async {
//     String img = await ref.read(realtorprovider).uploadImage(context, image);
//     // imagesList[tabIndex][index].add(img);
//     // imgFile[_tabIndex][index].add(File(path));
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
//     notifyListeners();
//   }

//   changeTabIndex({required int newTabIndex}) {
//     tabIndex = newTabIndex;
//     notifyListeners();
//   }

//   load() {
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
//     roomDataLoading = false;
//     selectedRoom = null;
//     selectedAllRooms = [];
//     allRoomFeature = [];
//     isLoading = true;
//     dataListItemIsEmpty = false;
//     allData = [];
//     notifyListeners();
//   }

//   Future<int> createproject() async {
//     Response res =
//         await dioClient.rawwithFormData(apiEnd: create_projet, Data: allData);

//     log("sjljlflzs === " + res.toString());
//     log("sjljlflzs === data " + allData.toString());
//     if (res.statusCode == 200) {
//       restartProject();
//     }
//     return res.data['project_id'];
//   }
// }

// class SelectedFeatureModel {
//   SelectedFeatureModel(
//       {required this.featureId,
//       required this.roomId,
//       required this.checkBox,
//       required this.descrptionController,
//       required this.images});
//   int roomId;
//   int featureId;
//   bool checkBox;
//   TextEditingController descrptionController;
//   List<String> images;
// }
// Remove above Code After 26/4/2025

