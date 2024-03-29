// ignore_for_file: unused_local_variable, curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:developer';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/model/Customer/FeatureOptionIssue.dart';
import 'package:dazllapp/model/Customer/Featureissue.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';
import 'package:dazllapp/model/Customer/project.dart';
import 'package:dazllapp/model/Customer/Features.dart';
import 'package:dazllapp/model/Customer/userModel.dart';
import 'package:dio/dio.dart';

class CustomerNotifier extends BaseNotifier {
  List<Room> listOfRoom = [];
  List<RoomFeature> listOfFeature = [];
  List<FeatureoptionIssue> listOfFeatureOptionissues = [];
  List<FeatureOption> listOfoption = [];
  List<Featureissue> listOfissues = [];
  List<Project> listofproject = [];
  List<Roominfo> listofRoomsinfo = [];
  List<Featureinfo> listofFeatureinfo = [];
  CustomerUserModel? customerUserModel;

  // List<Image> listofimages = [];
  Future<void> setCustomerModel() async {
    String data = await SpHelpers.getString(SharedPrefsKeys.customerUser) ?? "";
    if (data.isNotEmpty) {
      customerUserModel = CustomerUserModel.fromJson(jsonDecode(data));
    }

    // notifyListeners();
  }

  Future getRooms() async {
    final res = await dioClient.getRequest(apiEnd: rooms);
    listOfRoom = List<Room>.from(res.data['data'].map((x) => Room.fromJson(x)));
    notifyListeners();
  }

  Future getRoomsFeature(roomid) async {
    final res = await dioClient.getRequest(
      apiEnd: roomsfeature + roomid.toString(),
    );
    listOfFeature = List<RoomFeature>.from(
        res.data['data'].map((x) => RoomFeature.fromJson(x)));
    log("listOfFeature == $listOfFeature");
    log("listOfFeature == ${listOfFeature.length}");
    notifyListeners();
  }

  Future getFeatureOptionIssues() async {
    final res = await dioClient.getRequest(apiEnd: featureoption);
    listOfFeatureOptionissues = List<FeatureoptionIssue>.from(
        res.data['data'].map((x) => FeatureoptionIssue.fromJson(x)));
    for (int a = 0; a < res.data['data'].length; a++) {
      for (int b = 0; b < res.data['data'][a]['feature_options'].length; b++) {
        listOfoption.add(
            FeatureOption.fromJson(res.data['data'][a]['feature_options'][b]));
      }
    }
    notifyListeners();
  }

  Future getfeatureissue(int Featureoptionid) async {
    final res = await dioClient.getRequest(
        apiEnd: featureIssues + Featureoptionid.toString());
    listOfissues = List<Featureissue>.from(
        res.data['data'].map((x) => Featureissue.fromJson(x)));
    notifyListeners();
  }

  Future updateUser({required Map<String, dynamic> data}) async {
    Response res =
        await dioClient.patchwithRowData(apiEnd: update_realtor, Data: data);
    customerUserModel = CustomerUserModel.fromJson(res.data);
    return res.data;
  }

  Future updateReport(
      {required Map<String, dynamic> data, required int projectId}) async {
    Response res = await dioClient.patchwithRowData(
        apiEnd: update_customer_report + projectId.toString(), Data: data);

    return res.data;
  }

  Future<int> createproject(List<Map<String, dynamic>> data) async {
    Response res =
        await dioClient.rawwithFormData(apiEnd: create_projet, Data: data);

    log("sjljlflzs === " + res.toString());
    log("sjljlflzs ===data " + data.toString());
    return res.data['project_id'];
  }

  Future uploadimages(int projectId, List files) async {
    var data = {
      "images[]": files
          .map((item) => MultipartFile.fromFileSync(item.path,
              filename: item.path.split('/').last))
          .toList(),
      "projectID": projectId.toString()
    };
    final response =
        await dioClient.PostwithFormData(apiEnd: uploadimage, Data: data);
    log("images = " + response.data.toString());
    log("projectID" + projectId.toString());
    log("images" + files.toString());
  }

  Future myproject() async {
    Response res = await dioClient.getRequest(apiEnd: my_project);
    listofproject =
        List<Project>.from(res.data['data'].map((x) => Project.fromJson(x)));
    listofproject.sort((a, b) => b.projectId!.compareTo(a.projectId ?? 0));
    for (int a = 0; a < res.data['data'].length; a++) {
      for (int b = 0; b < res.data['data'][a]['roominfo'].length; b++) {
        listofRoomsinfo
            .add(Roominfo.fromJson(res.data['data'][a]['roominfo'][b]));
    
      }
    }

    // for (int a = 0; a < res.data['data'].length; a++) {
    //   for (int b = 0; b < res.data['data'][a]['images'].length; b++) {
    //     // listofimages.add(Image.fromJson(res.data['data'][a]['images'][b]));
    //   }
    // }

    for (int c = 0; c < res.data['data'].length; c++) {
      for (int d = 0; d < res.data['data'][c]['roominfo'].length; d++) {
        for (int e = 0;
            e < res.data['data'][c]['roominfo'][d]['feature'].length;
            e++) {
          listofFeatureinfo.add(Featureinfo.fromJson(
              res.data['data'][c]['roominfo'][d]['feature'][e]));
        }
      }
    }
    log('--------------->>>>' + listofFeatureinfo.toString());
    notifyListeners();
  }
}
