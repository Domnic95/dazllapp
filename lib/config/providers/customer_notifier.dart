// ignore_for_file: unused_local_variable, curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/model/Customer/FeatureOptionIssue.dart';
import 'package:dazllapp/model/Customer/Featureissue.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';
import 'package:dazllapp/model/Customer/project.dart';
import 'package:dazllapp/model/Customer/Features.dart';
import 'package:dazllapp/model/Customer/userModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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

  final imgPicker = ImagePicker();
  Future<String> uploadImage(
    BuildContext context,
    File files,
  ) async {
    try {
      var formData = {
        "image": MultipartFile.fromFileSync(files.path,
            filename: files.path.split('/').last),
      };
      Response response =
          await dioClient.PostwithFormData(apiEnd: getImage, Data: formData);
      log("images = " + response.data.toString());
      // log("projectID" + projectId.toString());
      // log("images" + files.toString());
      return response.data['image'].toString();
    } catch (e) {
      toastShowError(context, 'Something Went to wrong!');
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Something Went to wrong!'),
      //   backgroundColor: primaryColor,
      // ));
      throw e;
    }
  }

  Future getRooms() async {
    final res = await dioClient.getRequest(apiEnd: rooms);
    listOfRoom = List<Room>.from(res.data['data'].map((x) => Room.fromJson(x)));
    notifyListeners();
  }

  Future<String> getImage1(
      BuildContext context, File image, WidgetRef ref) async {
    String img = await ref.read(customernotifier).uploadImage(context, image);
    return img;
  }

  Future getRoomsFeature(roomid) async {
    final res = await dioClient.getRequest(
      apiEnd: roomsfeature + roomid.toString(),
    );
    listOfFeature = List<RoomFeature>.from(
        res.data['data'].map((x) => RoomFeature.fromJson(x)));
    // log("listOfFeature == $listOfFeature");
    // log("listOfFeature == ${listOfFeature.length}");
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
    log('message');
    Response res =
        await dioClient.patchwithRowData(apiEnd: update_realtor, Data: data);
    customerUserModel = CustomerUserModel.fromJson(res.data);
    return res.data;
  }

  Future updateReport(
      {required Map<String, dynamic> data, required int projectId}) async {
    log("update api + ${update_customer_report + projectId.toString()}");
    Response res = await dioClient.patchwithRowData(
        apiEnd: update_customer_report + projectId.toString(), Data: data);

    return res.data;
  }

  Future updateCustomer(
      {required Map<String, dynamic> data, required int projectId}) async {
    log("update api + ${update_customer + projectId.toString()}");
    Response res = await dioClient.patchwithRowData(
        apiEnd: update_customer_report + projectId.toString(), Data: data);

    return res.data;
  }
  Future<int> createproject(List<Map<String, dynamic>> data) async {
    Response res =
        await dioClient.rawwithFormData(apiEnd: create_projet, Data: data);

    // log("sjljlflzs === " + res.toString());
    // log("sjljlflzs ===data " + data.toString());
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
    // log("images = " + response.data.toString());
    // log("projectID" + projectId.toString());
    // log("images" + files.toString());
  }

  Future<Response> deleteCustomerProjects(
      int projectId, BuildContext context) async {
    try {
      Response res = await dioClient.deletewithRowData(
          apiEnd: deleteCustomerProject + '${projectId}');
      log("Response === ${res.statusCode}");
      if (res.statusCode == 200) {
        toastShowSuccess(context, 'Delete Successfully');
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Delete Successfully'),
        //   backgroundColor: primaryColor,
        // ));
      }
      return res;
    } catch (e) {
      Navigator.of(context).pop();
      toastShowError(context, 'Something Went to wrong!');
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Something Went to wrong!'),
      //   backgroundColor: primaryColor,
      // ));

      throw e;
    }
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
    // log('--------------->>>>' + listofFeatureinfo.toString());
    notifyListeners();
  }
}
