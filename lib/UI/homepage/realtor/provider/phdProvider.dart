// import 'dart:developer';
// import 'dart:io';

// import 'package:dazllapp/config/providers/base_notifier.dart';
// import 'package:dazllapp/config/providers/customer_notifier.dart';
// import 'package:dazllapp/config/providers/providers.dart';
// import 'package:dazllapp/model/Customer/Features.dart';
// import 'package:dazllapp/model/Customer/Rooms.dart';
// import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// enum Status { loading, complited }

// class PhdProvider extends BaseNotifier {
//   Status status = Status.loading;
//   int _tabIndex = 0;
//   int get tabIndex => _tabIndex;
//   List<Room> _rooms = [];
//   List<Room> get rooms => _rooms;
//   bool _loading = true;
//   bool get loading => _loading;
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
//   List<String> _description = [];
//   List<List<File>> mainImgFile = [];
//   List<List<String>> mainImgList = [];
//   List<List<List<File>>> imgFile = [];
//   final imgPicker = ImagePicker();
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
//   List<List<RoomFeature>> phdListOfFeature = [];
//   String fristImpression = "DAZLING";
//   List<String> selectedFristImpressionList = [];
//   String address = "";
//   String firstName = '';
//   String lastName = '';
//   String clientEmail = '';
//   String _stateName = '';
//   String get stateName => _stateName;
//   String zipCode = "415241";
//   int startRange = 450;
//   int endRange = 800;
//   void setRange(int start, int end) {
//     startRange = start;
//     endRange = end;
//     // notifyListeners();
//   }

//   void selectRoomType(AddValueData data, int index) {
//     _selectRoomTypeFeature[0][index] = data;
//     log('vjksdbvkjskj--  selectroom ---- ${_selectRoomTypeFeature[_tabIndex][index]}');
//     notifyListeners();
//   }

//   void SelectAddValueData(bool value, int index) {
//     selectedaddValueData[_tabIndex][index] = value;
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

//   void init({required int roomid, required CustomerNotifier roomsNotifier}) {
//     final room =
//         roomsNotifier.listOfRoom.where((element) => element.id == roomid);
//     _rooms.insert(0, room.first);
//     _roomIdList.insert(0, roomid);
//     // // log("asjflsfldslk===   $roomIdList");
//     featureId.insert(0, []);
//     featurebool.insert(0, []);
//     imgFile.insert(0, []);
//     imagesList.insert(0, []);
//     mainImgFile.insert(0, []);
//     mainImgList.insert(0, []);
//     _selectRoomTypeFeature.insert(0, []);
//     _selectedaddValueData.insert(0, []);
//     selectedFristImpressionList.insert(0, 'DAZLING');
//     // featureoptionid.add([]);
//     select.insert(0, []);
//     selectedCheckbox.insert(0, []);
//     _DescrptionController2.insert(0, []);
//     _DescrptionController.insert(0, TextEditingController());
//     // _description.add([]);
//     isSet.insert(0, false);
//   }

//   void setTabIndex({required int tabIndex}) {
//     _tabIndex = tabIndex;
//     notifyListeners();
//   }

//   set(bool value, int index) {
//     isSet[index] = value;
//     notifyListeners();
//   }

//   Future getImage(BuildContext context, int tabIndex, int index, File image,
//       bool isMainImage, WidgetRef ref) async {
//     if (isMainImage) {
//       log("Main Img");
//       String img = await ref.read(realtorprovider).uploadImage(context, image);
//       mainImgList[tabIndex].add(img);
//       // imgFile[_tabIndex][index].add(File(path));
//       // log("mage == $imagesList");
//     } else {
//       log("no main Img");
//       String img = await ref.read(realtorprovider).uploadImage(context, image);
//       imagesList[tabIndex][index].add(img);
//       // imgFile[_tabIndex][index].add(File(path));
//       // log("mage == $imagesList");
//     }
//   }

//   void resetData() {
//     phdListOfFeature.clear();
//     _rooms.clear();
//     _roomIdList.clear();
//     _selectRoomTypeFeature.clear();
//     // // log("asjflsfldslk===   $roomIdList");
//     featureId.clear();
//     featurebool.clear();
//     imgFile.clear();
//     imagesList.clear();
//     mainImgFile.clear();
//     mainImgList.clear();
//     // featureoptionid.add([]);
//     select.clear();
//     selectedCheckbox.clear();
//     _DescrptionController2.clear();
//     _DescrptionController.clear();
//     // _description.add([]);
//     isSet.clear();
//   }

//   loaddata(BuildContext context, int roomid, WidgetRef ref) async {
//     status = Status.loading;
//     final _roomsfeature = ref.read(customernotifier);
//     final _roomProvider = ref.read(realtorprovider);

//     await _roomsfeature.getRoomsFeature(roomid);
//     await _roomsfeature.getFeatureOptionIssues();

//     await _roomProvider.getRoomFeature(roomid);
//     _selectedaddValueData[_tabIndex].clear();
//     _selectRoomTypeFeature[_tabIndex].clear();
//     // _selectRoomTypeFeature[_tabIndex] =
//     // _roomProvider.roomTypes[_tabIndex].last.type!;
//     for (var i = 0; i < _roomProvider.roomTypes[_tabIndex].length; i++) {
//       _selectRoomTypeFeature[_tabIndex]
//           .insert(0, _roomProvider.roomTypes[_tabIndex][i].type!);
//       // _selectRoomTypeFeature[_tabIndex]=_roomProvider.roomTypes[_tabIndex].;
//     }
//     for (var i = 0; i < _roomProvider.addValueData[_tabIndex].length; i++) {
//       _selectedaddValueData[_tabIndex].insert(0, false);
//     }
//     phdListOfFeature.insert(0, _roomsfeature.listOfFeature);
//     for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
//       select.insert(0, []);
//       // _description2.add('');
//       _DescrptionController2[tabIndex].insert(0, TextEditingController());
//       // DataLoding[tabIndex].add(false);
//       imgFile[tabIndex].insert(0, []);
//       imagesList[tabIndex].insert(0, []);
//       featureId[tabIndex].insert(0, 0);
//       featurebool[tabIndex].insert(0, []);
//     }
//     status = Status.complited;
//     notifyListeners();
//     // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
//     //   FeatureissueName.add([]);
//     // }
//     // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
//     //   FeatureissueId.add([]);
//     // }
//     // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
//     //   // select.add([]);
//     //   roomDetailImg.add([]);
//     //   // setState(() {
//     //   //   loading = false;
//     //   // });
//     //   // log(select.toString());
//     // }
//     // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
//     //   // select.add([]);
//     //   DataLoding.add(false);
//     //   // setState(() {
//     //   //   loading = false;
//     //   // });
//     //   // log(select.toString());
//     // }
//     // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
//     //   // select.add([]);
//     //   featureId.add(0);
//     //   // setState(() {
//     //   //   loading = false;
//     //   // });
//     //   // log(select.toString());
//     // }
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/UI/homepage/customer/model/selectedFeature_model.dart';
import 'package:dazllapp/config/Utils/utils.dart';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';
import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constant/colors.dart';
import '../complitedPhd/selectCustomer.dart';

enum Status { loading, complited }

class PhdProvider extends BaseNotifier {
  List<GetRoomFeature> allRoomsData = [];
  Room? selectedRoom;
  List<Room> selectedAllRooms = [];
  bool isLoading = true;
  bool addNewDataLoading = true;
  final imgPicker = ImagePicker();
  bool dataListItemIsEmpty = false;
  Map<String, dynamic> allData = {};
  int tabIndex = 0;
  int roomId = -1;
  int startRange = 450;
  bool selectedOptionValue = false;
  String selectedPrice = '';
  String customPrice = '';
  TextEditingController ohterPrice = TextEditingController();
  int endRange = 800;

  setRoomFeatureData({required int roomId, required int tabIndex}) async {
    final res = await dioClient.getRequest(
      apiEnd: roomsfeature + roomId.toString(),
    );
    log("=-=--=-==->>. ${roomsfeature + roomId.toString()}");
    GetRoomFeature resData = GetRoomFeature.fromJson(res.data);
    // List<RoomFeature> newRoomFeature = List<RoomFeature>.from(
    //     res.data["data"].map((x) => RoomFeature.fromJson(x)));
    allRoomsData.insert(tabIndex, resData);

    for (var i = 0; i < allRoomsData[tabIndex].data!.length; i++) {
      allRoomsData[tabIndex].data![i].selectedFeatureForOneTabs =
          SelectedFeatureModel(
              roomId: -1,
              featureId: -1,
              checkBox: false,
              descrptionController: TextEditingController(),
              images: []);

      allRoomsData[tabIndex].impressions = fristImpressionList[0];
      allRoomsData[tabIndex].singleTabController = TextEditingController();
      allRoomsData[tabIndex].images = [];
      allRoomsData[tabIndex].roomId = roomId;
    }
  }

  addSeletedRoom({required Room addRoom, required int tabIndex}) async {
    log("------ ${tabIndex}");
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
    allRoomsData[tabIndex]
        .data![selectedFeatureIndex]
        .selectedFeatureForOneTabs
        .checkBox = value;
    if (value) {
      allRoomsData[tabIndex]
          .data![selectedFeatureIndex]
          .selectedFeatureForOneTabs
          .featureId = setFeatureId;
      allRoomsData[tabIndex]
          .data![selectedFeatureIndex]
          .selectedFeatureForOneTabs
          .roomId = selectedRoom!.id;
    } else {
      allRoomsData[tabIndex]
              .data![selectedFeatureIndex]
              .selectedFeatureForOneTabs =
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

    log("tabIndex =-=- ${tabIndex}");
    notifyListeners();
  }

  loadData(
      {required BuildContext context,
      required RealtorNotifier realtorProvider}) {
    allData = {};
    dataListItemIsEmpty = false;
    allData = {
      'score': 100,
      'address': address,
      'first_name': firstName,
      'last_name': lastName,
      'client_email': clientEmail,
      'type': realtorProvider.housedata!.type,
      "year_built": realtorProvider.housedata!.yearBuilt,
      "bedrooms": realtorProvider.housedata!.bedrooms,
      "bathrooms": realtorProvider.housedata!.bathrooms,
      "structure_type": realtorProvider.housedata!.structureType,
      "lot_size": realtorProvider.housedata!.lotSize,
      "location": realtorProvider.housedata!.location,
      "foundation_type": realtorProvider.housedata!.foundationType,
      "tax_accessed_value": realtorProvider.housedata!.taxAccessedValue!.isEmpty
          ? "1"
          : realtorProvider.housedata!.taxAccessedValue,
      "sale_date": realtorProvider.housedata!.saleDate!.isEmpty
          ? "01-11-2021"
          : realtorProvider.housedata!.saleDate,
      "lowest_price": startRange,
      //left:calc(-50% - 4px)
      "highest_price": endRange.toString(),
      // "zip_code": _phdProvider.zipCode,
      "zip_code": "123456",
      "house_id": '',
      // "customer_id": 1,
      "mid_price": '500',
      "true": 'true',
      "final": 1,
      "slider_value": realtorProvider.sliderValue,
      "selectedOptionValue": selectedOptionValue,
      "selectedPrice":selectedPrice == 'Other' ? 0 :  int.parse(selectedPrice),
      "customPrice":ohterPrice.text.isEmpty ? 0 : int.parse( ohterPrice.text),
    };

    for (var i = 0; i < allRoomsData.length; i++) {
      List<bool> checkBoxCheking = [];
      allData["room_id"] = allRoomsData[i].roomId;
      if (allRoomsData[i].singleTabController!.text.isNotEmpty) {
        allData["phd_description"] =
            allRoomsData[i].singleTabController!.text.toString();
      }
      if (allRoomsData[i].images!.isNotEmpty) {
        for (var j = 0; j < allRoomsData[i].images!.length; j++) {
          allData['images[$j]'] = allRoomsData[i].images![j];
        }
      }
      if (allRoomsData[i].impressions!.isNotEmpty) {
        allData["rooms[${allRoomsData[i].roomId}][status]"] =
            allRoomsData[i].impressions;
      }
      for (var k = 0; k < allRoomsData[i].roomtype!.length; k++) {
        if (allRoomsData[i].roomtype![k].selectedDropDown != null) {
          allData["rooms[${allRoomsData[i].roomId}][feature_type][${allRoomsData[i].roomtype![k].id}]"] =
              allRoomsData[i].roomtype![k].selectedDropDown;
        }
      }
      for (var k = 0; k < allRoomsData[i].addValueData!.length; k++) {
        if (allRoomsData[i].addValueData![k].optionSelected ?? false) {
          allData["rooms[${allRoomsData[i].roomId}][additional][$k]"] =
              allRoomsData[i].addValueData![k].id;
        }
      }

      for (var j = 0; j < allRoomsData[i].data!.length; j++) {
        SelectedFeatureModel itemModel =
            allRoomsData[i].data![j].selectedFeatureForOneTabs;
        if (itemModel.checkBox) {
          checkBoxCheking.add(true);
          if (itemModel.descrptionController.text.isNotEmpty &&
              itemModel.images.isNotEmpty) {
            allData["rooms[${allRoomsData[i].roomId}][feature_status][${allRoomsData[i].data![j].id}]"] =
                allRoomsData[i].impressions;
            allData["rooms[${allRoomsData[i].roomId}][feature_issues_images_descr][${allRoomsData[i].data![j].id}]"] =
                itemModel.descrptionController.text;
            for (var s = 0; s < itemModel.images.length; s++) {
              allData["rooms[${allRoomsData[i].roomId}][feature_issues_images][${allRoomsData[i].data![j].id}][$s]"] =
                  itemModel.images[s];
            }
          } else {
            log("vsvssvs ===> 1");
            dataListItemIsEmpty = true;
            allData = {};
            notifyListeners();
            break;
          }
        } else {
          log("vsvssvs ===> 1 efefe");
          checkBoxCheking.add(false);
        }
      }
      log("cscfsacfsaf ===> 1 efefe" + checkBoxCheking.toString());
      if (!checkBoxCheking.contains(true)) {
        dataListItemIsEmpty = true;
        log("vsvssvs ===> 2 ");
        allData = {};
        notifyListeners();
        break;
      }
    }
  }

  Future createPhdReport({required BuildContext context}) async {
    Response response = await dioClient.PostwithFormData(
        apiEnd: create_phd_realtor, Data: allData);

    Utils.loaderDialog(context, false);

    log("response.statusCode =-=->>  ${response.statusCode}");
    log("allData =-=->>  ${allData}");
    log("res =-=->>  ${response}");

    if (response.statusCode == 200) {
      log("=-====---=-=-======--->>>>44  ");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('PHD created sucessfully'),
      //   backgroundColor: teamColor,
      // ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SelectCustomer(),
          ),
          (route) => false).then((value) {
        restartProject();
      });
      allRoomsData.clear();
      log("=-====---=-=-======--->>>>33  ");
    }
  }

  void restartProject() {
    selectedRoom = null;
    selectedAllRooms = [];
    allRoomsData = [];
    isLoading = true;
    dataListItemIsEmpty = false;
    allData = {};
    notifyListeners();
  }

  void selectRoomType({required AddValueData data, required int index}) {
    allRoomsData[tabIndex].roomtype![index].selectedtype = data.name!;
    allRoomsData[tabIndex].roomtype![index].selectedDropDown = data.id!;

    // _selectRoomTypeFeature[0][index] = data;
    notifyListeners();
  }

  void SelectAddValueData({required bool value, required int index}) {
    allRoomsData[tabIndex].addValueData![index].optionSelected = value;
    // selectedaddValueData[tabIndex][index] = value;
    notifyListeners();
  }

  void storePropertiesDetails(
      {required String paddress,
      // required String state,
      // required String pincode,
      required String firstname,
      required String lastname,
      required String clientemail}) {
    address = paddress;
    // _stateName = state;
    // zipCode = pincode;
    firstName = firstname;
    lastName = lastname;
    clientEmail = clientemail;
  }

  void setRange(int start, int end) {
    startRange = start;
    endRange = end;
    // notifyListeners();
  }

  // Future<int> createproject() async {
  //   Response res = await dioClient.rawwithFormData(
  //       apiEnd: create_project_realtor, Data: allData);

  //   log("sjljlflzs === " + res.toString());
  //   log("sjljlflzs === data " + allData.toString());
  //   if (res.statusCode == 200) {
  //     restartProject();
  //   }
  //   return res.data['project_id'];
  // }

  List<int> _roomIdList = [];
  List<int> get roomIdList => _roomIdList;
  List<bool> isSet = [];
  List<List<int>> currenoptionselectedid = [];

  //  bool dataLoading = false;
  bool Fireplace = false;
  bool hasBasement = false;
  bool Upgraded_Appliances = false;
  bool Custom_Cabinetry = false;
  bool DAZLING = false;
  bool MARKET_READY = false;
  bool NEEDS_DAZL = false;
  List<List<int>> featureId = [];
  bool more = false;
  bool moresecond = false;
  // List<String> _description2 = <String>[];
  List<List<TextEditingController>> _DescrptionController2 = [];
  List<List<TextEditingController>> get DescrptionController2 =>
      _DescrptionController2;

  List<TextEditingController> _DescrptionController = [];
  List<TextEditingController> get DescrptionController => _DescrptionController;
  List<List<File>> mainImgFile = [];
  List<List<String>> mainImgList = [];
  List<List<List<File>>> imgFile = [];
  // final imgPicker = ImagePicker();
  List<List<int>> select = [];
  // List<List<int>> featureissueId = [];
  List<List<int>> selectedbox = [];
  List<List> selectedCheckbox = [];
  // List<List<String>> FeatureissueName = [];
  // List<List<int>> FeatureissueId = [];
  // List<List<bool>> DataLoding = [];
  List<List<List<bool>>> featurebool = [];
  List<List<List<String>>> imagesList = [];
  List<List<AddValueData>> _selectRoomTypeFeature = [];
  List<List<AddValueData?>> get selectRoomTypeFeature => _selectRoomTypeFeature;
  List<List<bool>> _selectedaddValueData = [];
  List<List<bool>> get selectedaddValueData => _selectedaddValueData;
  List<String> fristImpressionList = ["DAZLING", "MARKET READY", "NEEDS DAZL"];
  // List<List<RoomFeature>> phdListOfFeature = [];
  String fristImpression = "DAZLING";
  List<String> selectedFristImpressionList = [];
  String address = "";
  String firstName = '';
  String lastName = '';
  String clientEmail = '';
  String _stateName = '';
  String get stateName => _stateName;
  String zipCode = "415241";
}
