import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/model/Customer/Features.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';
import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

enum Status { loading, complited }

class PhdProvider extends BaseNotifier {
  Status status = Status.loading;
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  List<Room> _rooms = [];
  List<Room> get rooms => _rooms;
  bool _loading = true;
  bool get loading => _loading;
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
  List<String> _description = [];
  List<List<File>> mainImgFile = [];
  List<List<String>> mainImgList = [];
  List<List<List<File>>> imgFile = [];
  final imgPicker = ImagePicker();
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
  List<List<RoomFeature>> phdListOfFeature = [];
  String fristImpression = "DAZLING";
  List<String> selectedFristImpressionList = [];
  String address = "";
  String firstName = '';
  String lastName = '';
  String clientEmail = '';
  String _stateName = '';
  String get stateName => _stateName;
  String zipCode = "415241";
  int startRange = 450;
  int endRange = 800;
  void setRange(int start, int end) {
    startRange = start;
    endRange = end;
    // notifyListeners();
  }

  void selectRoomType(AddValueData data, int index) {
    _selectRoomTypeFeature[0][index] = data;
    log('vjksdbvkjskj--  selectroom ---- ${_selectRoomTypeFeature[_tabIndex][index]}');
    notifyListeners();
  }

  void SelectAddValueData(bool value, int index) {
    selectedaddValueData[_tabIndex][index] = value;
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

  void init({required int roomid, required CustomerNotifier roomsNotifier}) {
    final room =
        roomsNotifier.listOfRoom.where((element) => element.id == roomid);
    _rooms.insert(0, room.first);
    _roomIdList.insert(0, roomid);
    // // log("asjflsfldslk===   $roomIdList");
    featureId.insert(0, []);
    featurebool.insert(0, []);
    imgFile.insert(0, []);
    imagesList.insert(0, []);
    mainImgFile.insert(0, []);
    mainImgList.insert(0, []);
    _selectRoomTypeFeature.insert(0, []);
    _selectedaddValueData.insert(0, []);
    selectedFristImpressionList.insert(0, 'DAZLING');
    // featureoptionid.add([]);
    select.insert(0, []);
    selectedCheckbox.insert(0, []);
    _DescrptionController2.insert(0, []);
    _DescrptionController.insert(0, TextEditingController());
    // _description.add([]);
    isSet.insert(0, false);
  }

  void setTabIndex({required int tabIndex}) {
    _tabIndex = tabIndex;
    notifyListeners();
  }

  set(bool value, int index) {
    isSet[index] = value;
    notifyListeners();
  }

  Future getImage(BuildContext context, int tabIndex, int index, File image,
      bool isMainImage, WidgetRef ref) async {
    if (isMainImage) {
      log("Main Img");
      String img = await ref.read(realtorprovider).uploadImage(context, image);
      mainImgList[tabIndex].add(img);
      // imgFile[_tabIndex][index].add(File(path));
      // log("mage == $imagesList");
    } else {
      log("no main Img");
      String img = await ref.read(realtorprovider).uploadImage(context, image);
      imagesList[tabIndex][index].add(img);
      // imgFile[_tabIndex][index].add(File(path));
      // log("mage == $imagesList");
    }
  }

  void resetData() {
    phdListOfFeature.clear();
    _rooms.clear();
    _roomIdList.clear();
    _selectRoomTypeFeature.clear();
    // // log("asjflsfldslk===   $roomIdList");
    featureId.clear();
    featurebool.clear();
    imgFile.clear();
    imagesList.clear();
    mainImgFile.clear();
    mainImgList.clear();
    // featureoptionid.add([]);
    select.clear();
    selectedCheckbox.clear();
    _DescrptionController2.clear();
    _DescrptionController.clear();
    // _description.add([]);
    isSet.clear();
  }

  loaddata(BuildContext context, int roomid, WidgetRef ref) async {
    status = Status.loading;
    final _roomsfeature = ref.read(customernotifier);
    final _roomProvider = ref.read(realtorprovider);

    await _roomsfeature.getRoomsFeature(roomid);
    await _roomsfeature.getFeatureOptionIssues();

    await _roomProvider.getRoomFeature(roomid);
    _selectedaddValueData[_tabIndex].clear();
    _selectRoomTypeFeature[_tabIndex].clear();
    // _selectRoomTypeFeature[_tabIndex] =
    // _roomProvider.roomTypes[_tabIndex].last.type!;
    for (var i = 0; i < _roomProvider.roomTypes[_tabIndex].length; i++) {
      _selectRoomTypeFeature[_tabIndex]
          .insert(0, _roomProvider.roomTypes[_tabIndex][i].type!);
      // _selectRoomTypeFeature[_tabIndex]=_roomProvider.roomTypes[_tabIndex].;
    }
    for (var i = 0; i < _roomProvider.addValueData[_tabIndex].length; i++) {
      _selectedaddValueData[_tabIndex].insert(0, false);
    }
    phdListOfFeature.insert(0, _roomsfeature.listOfFeature);
    for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
      select.insert(0, []);
      // _description2.add('');
      _DescrptionController2[tabIndex].insert(0, TextEditingController());
      // DataLoding[tabIndex].add(false);
      imgFile[tabIndex].insert(0, []);
      imagesList[tabIndex].insert(0, []);
      featureId[tabIndex].insert(0, 0);
      featurebool[tabIndex].insert(0, []);
    }
    status = Status.complited;
    notifyListeners();
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   FeatureissueName.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   FeatureissueId.add([]);
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   // select.add([]);
    //   roomDetailImg.add([]);
    //   // setState(() {
    //   //   loading = false;
    //   // });
    //   // log(select.toString());
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   // select.add([]);
    //   DataLoding.add(false);
    //   // setState(() {
    //   //   loading = false;
    //   // });
    //   // log(select.toString());
    // }
    // for (int i = 0; i < _roomsfeature.listOfFeature.length; i++) {
    //   // select.add([]);
    //   featureId.add(0);
    //   // setState(() {
    //   //   loading = false;
    //   // });
    //   // log(select.toString());
    // }
  }
}
