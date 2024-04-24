// import 'dart:developer';
// import 'dart:io';

// import 'package:dazllapp/UI/homepage/customer/model/selectedFeature_model.dart';
// import 'package:dazllapp/config/Utils/utils.dart';
// import 'package:dazllapp/config/api.dart';
// import 'package:dazllapp/config/providers/base_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/config/providers/realtor_notifier.dart';
// import 'package:dazllapp/constant/spkeys.dart';
// import 'package:dazllapp/model/Customer/Features.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../../constant/colors.dart';
// import '../../complitedPhd/selectCustomer.dart';
// import '../../realtor_homepage.dart';

// enum Status { loading, complited }

// class TestPhdProvider extends BaseNotifier {
//   List<GetRoomFeature> allRoomsData = [];
//   Room? selectedRoom;
//   List<Room> selectedAllRooms = [];
//   bool isLoading = true;
//   bool addNewDataLoading = true;
//   final imgPicker = ImagePicker();
//   bool dataListItemIsEmpty = false;
//   Map<String, dynamic> allData = {};
//   int tabIndex = 0;
//   int roomId = -1;
//   int startRange = 450;

//   int endRange = 800;

//   setRoomFeatureData({required int roomId, required int tabIndex}) async {
//     final res = await dioClient.getRequest(
//       apiEnd: roomsfeature + roomId.toString(),
//     );
//     GetRoomFeature resData = GetRoomFeature.fromJson(res.data);
//     // List<RoomFeature> newRoomFeature = List<RoomFeature>.from(
//     //     res.data["data"].map((x) => RoomFeature.fromJson(x)));
//     allRoomsData.insert(tabIndex, resData);

//     for (var i = 0; i < allRoomsData[tabIndex].data!.length; i++) {
//       allRoomsData[tabIndex].data![i].selectedFeatureForOneTabs =
//           SelectedFeatureModel(
//               roomId: -1,
//               featureId: -1,
//               checkBox: false,
//               descrptionController: TextEditingController(),
//               images: []);

//       allRoomsData[tabIndex].impressions = fristImpressionList[0];
//       allRoomsData[tabIndex].singleTabController = TextEditingController();
//       allRoomsData[tabIndex].images = [];
//       allRoomsData[tabIndex].roomId = roomId;
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
//     allRoomsData[tabIndex]
//         .data![selectedFeatureIndex]
//         .selectedFeatureForOneTabs
//         .checkBox = value;
//     if (value) {
//       allRoomsData[tabIndex]
//           .data![selectedFeatureIndex]
//           .selectedFeatureForOneTabs
//           .featureId = setFeatureId;
//       allRoomsData[tabIndex]
//           .data![selectedFeatureIndex]
//           .selectedFeatureForOneTabs
//           .roomId = selectedRoom!.id;
//     } else {
//       allRoomsData[tabIndex]
//               .data![selectedFeatureIndex]
//               .selectedFeatureForOneTabs =
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

//   loadData(
//       {required BuildContext context,
//       required RealtorNotifier realtorProvider}) {


//     allData = {};
//     dataListItemIsEmpty = false;
//     allData = {
//       'score': 100,
//       'address': address,
//       'first_name': firstName,
//       'last_name': lastName,
//       'client_email': clientEmail,
//       'type': realtorProvider.housedata!.type,
//       "year_built": realtorProvider.housedata!.yearBuilt,
//       "bedrooms": realtorProvider.housedata!.bedrooms,
//       "bathrooms": realtorProvider.housedata!.bathrooms,
//       "structure_type": realtorProvider.housedata!.structureType,
//       "lot_size": realtorProvider.housedata!.lotSize,
//       "location": realtorProvider.housedata!.location,
//       "foundation_type": realtorProvider.housedata!.foundationType,
//       "tax_accessed_value": realtorProvider.housedata!.taxAccessedValue!.isEmpty
//           ? "1"
//           : realtorProvider.housedata!.taxAccessedValue,
//       "sale_date": realtorProvider.housedata!.saleDate!.isEmpty
//           ? "01-11-2021"
//           : realtorProvider.housedata!.saleDate,
//       "lowest_price": startRange,
//       //left:calc(-50% - 4px)
//       "highest_price": endRange.toString(),
//       // "zip_code": _phdProvider.zipCode,
//       "zip_code": "123456",
//       "house_id": '',
//       // "customer_id": 1,
//       "mid_price": '500',
//       "true": 'true',
//       "final": 1,
//     };

//     for (var i = 0; i < allRoomsData.length; i++) {
//       List<bool> checkBoxCheking = [];
//       allData["room_id"] = allRoomsData[i].roomId;
//       if (allRoomsData[i].singleTabController!.text.isNotEmpty) {
//         allData["phd_description"] =
//             allRoomsData[i].singleTabController!.text.toString();
//       }
//       if (allRoomsData[i].images!.isNotEmpty) {
//         for (var j = 0; j < allRoomsData[i].images!.length; j++) {
//           allData['images[$j]'] = allRoomsData[i].images![j];
//         }
//       }
//       if (allRoomsData[i].impressions!.isNotEmpty) {
//         allData["rooms[${allRoomsData[i].roomId}][status]"] =
//             allRoomsData[i].impressions;
//       }
//       for (var k = 0; k < allRoomsData[i].roomtype!.length; k++) {
//         if (allRoomsData[i].roomtype![k].selectedDropDown != null) {
//           allData["rooms[${allRoomsData[i].roomId}][feature_type][${allRoomsData[i].roomtype![k].id}]"] =
//               allRoomsData[i].roomtype![k].selectedDropDown;
//         }
//       }
//       for (var k = 0; k < allRoomsData[i].addValueData!.length; k++) {
//         if (allRoomsData[i].addValueData![k].optionSelected ?? false) {
//           allData["rooms[${allRoomsData[i].roomId}][additional][$k]"] =
//               allRoomsData[i].addValueData![k].id;
//         }
//       }

//       for (var j = 0; j < allRoomsData[i].data!.length; j++) {
//         SelectedFeatureModel itemModel =
//             allRoomsData[i].data![j].selectedFeatureForOneTabs;
//         if (itemModel.checkBox) {
//           checkBoxCheking.add(true);
//           if (itemModel.descrptionController.text.isNotEmpty &&
//               itemModel.images.isNotEmpty) {
//             allData["rooms[${allRoomsData[i].roomId}][feature_status][${allRoomsData[i].data![j].id}]"] =
//                 allRoomsData[i].impressions;
//             allData["rooms[${allRoomsData[i].roomId}][feature_issues_images_descr][${allRoomsData[i].data![j].id}]"] =
//                 itemModel.descrptionController.text;
//             for (var s = 0; s < itemModel.images.length; s++) {
//               allData["rooms[${allRoomsData[i].roomId}][feature_issues_images][${allRoomsData[i].data![j].id}][$s]"] =
//                   itemModel.images[s];
//             }
//           } else {
//             dataListItemIsEmpty = true;
//             allData = {};
//             notifyListeners();
//             break;
//           }
//         } else {
//           checkBoxCheking.add(false);
//         }
//       }

//       if (!checkBoxCheking.contains(true)) {
//         dataListItemIsEmpty = true;
//         allData = {};
//         notifyListeners();
//         break;
//       }
//     }

//   }

//   Future createPhdReport(
//      {required BuildContext context}) async {
//     Response response = await dioClient.PostwithFormData(
//         apiEnd: create_phd_realtor, Data: allData);
//     Utils.loaderDialog(context, false);
  
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('PHD created sucessfully'),
//         backgroundColor: teamColor,
//       ));
//       allRoomsData.clear();
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SelectCustomer(),
//           ),
//           (route) => false);
//     }
//   }

//   void restartProject() {
//     selectedRoom = null;
//     selectedAllRooms = [];
//     allRoomsData = [];
//     isLoading = true;
//     dataListItemIsEmpty = false;
//     allData = {};
//     notifyListeners();
//   }

//   void selectRoomType({required AddValueData data, required int index}) {
//     allRoomsData[tabIndex].roomtype![index].selectedtype = data.name!;
//     allRoomsData[tabIndex].roomtype![index].selectedDropDown = data.id!;

//     // _selectRoomTypeFeature[0][index] = data;
//     notifyListeners();
//   }

//   void SelectAddValueData({required bool value, required int index}) {
//     allRoomsData[tabIndex].addValueData![index].optionSelected = value;
//     // selectedaddValueData[tabIndex][index] = value;
//     notifyListeners();
//   }

//   void storePropertiesDetails(
//       {required String paddress,
//       // required String state,
//       // required String pincode,
//       required String firstname,
//       required String lastname,
//       required String clientemail}) {
//     address = paddress;
//     // _stateName = state;
//     // zipCode = pincode;
//     firstName = firstname;
//     lastName = lastname;
//     clientEmail = clientemail;
//   }

//   void setRange(int start, int end) {
//     startRange = start;
//     endRange = end;
//     // notifyListeners();
//   }

//   // Future<int> createproject() async {
//   //   Response res = await dioClient.rawwithFormData(
//   //       apiEnd: create_project_realtor, Data: allData);

//   //   log("sjljlflzs === " + res.toString());
//   //   log("sjljlflzs === data " + allData.toString());
//   //   if (res.statusCode == 200) {
//   //     restartProject();
//   //   }
//   //   return res.data['project_id'];
//   // }

//   List<int> _roomIdList = [];
//   List<int> get roomIdList => _roomIdList;
//   List<bool> isSet = [];
//   List<List<int>> currenoptionselectedid = [];

//   //  bool dataLoading = false;
//   bool Fireplace = false;
//   bool hasBasement = false;
//   bool Upgraded_Appliances = false;
//   bool Custom_Cabinetry = false;
//   bool DAZLING = false;
//   bool MARKET_READY = false;
//   bool NEEDS_DAZL = false;
//   List<List<int>> featureId = [];
//   bool more = false;
//   bool moresecond = false;
//   // List<String> _description2 = <String>[];
//   List<List<TextEditingController>> _DescrptionController2 = [];
//   List<List<TextEditingController>> get DescrptionController2 =>
//       _DescrptionController2;

//   List<TextEditingController> _DescrptionController = [];
//   List<TextEditingController> get DescrptionController => _DescrptionController;
//   List<List<File>> mainImgFile = [];
//   List<List<String>> mainImgList = [];
//   List<List<List<File>>> imgFile = [];
//   // final imgPicker = ImagePicker();
//   List<List<int>> select = [];
//   // List<List<int>> featureissueId = [];
//   List<List<int>> selectedbox = [];
//   List<List> selectedCheckbox = [];
//   // List<List<String>> FeatureissueName = [];
//   // List<List<int>> FeatureissueId = [];
//   // List<List<bool>> DataLoding = [];
//   List<List<List<bool>>> featurebool = [];
//   List<List<List<String>>> imagesList = [];
//   List<List<AddValueData>> _selectRoomTypeFeature = [];
//   List<List<AddValueData?>> get selectRoomTypeFeature => _selectRoomTypeFeature;
//   List<List<bool>> _selectedaddValueData = [];
//   List<List<bool>> get selectedaddValueData => _selectedaddValueData;
//   List<String> fristImpressionList = ["DAZLING", "MARKET READY", "NEEDS DAZL"];
//   // List<List<RoomFeature>> phdListOfFeature = [];
//   String fristImpression = "DAZLING";
//   List<String> selectedFristImpressionList = [];
//   String address = "";
//   String firstName = '';
//   String lastName = '';
//   String clientEmail = '';
//   String _stateName = '';
//   String get stateName => _stateName;
//   String zipCode = "415241";
// }
