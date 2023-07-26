import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
import 'package:dazllapp/model/Realtor/housedata.dart';
import 'package:dazllapp/model/Realtor/realtor_customerlist.dart';

import 'package:dazllapp/model/Realtor/realtor_project.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RealtorNotifier extends BaseNotifier {
  List<Customer> listofcustomers = [];
  List<String> flooringList = [];
  List<List<Roomtype>> roomTypes = [];
  List<List<AddValueData>> addValueData = [];
  List<ProjectList> listofrealtorproject = [];
  Housedata? housedata;

  Future getcustomers() async {
    final res = await dioClient.getRequest(apiEnd: customer);
    listofcustomers = List<Customer>.from(
        res.data['customer'].map((x) => Customer.fromJson(x)));
    notifyListeners();
  }

  void reset() {
    roomTypes.clear();
    addValueData.clear();
  }

  Future getRoomFeature(int roomId) async {
    Response res = await dioClient.getRequest(apiEnd: "$getroomfeature$roomId");

    roomTypes.add(List.from(res.data["roomtype"] as List)
        .map((e) => Roomtype.fromJson(e))
        .toList());
    addValueData.add(List.from(res.data["addValueData"] as List)
        .map((e) => AddValueData.fromJson(e))
        .toList());
    print("cndcndlcn" + addValueData.toString());
    log("cndcndlcn" + addValueData.length.toString());
    notifyListeners();
  }

  Future<int> createprojectrealtor(List<Map<String, dynamic>> data) async {
    final res = await dioClient.rawwithFormData(
        apiEnd: create_project_realtor, Data: data);

    log(res.toString());
    log("data  " + data.toString());
    return res.data['project_id'];
  }

  Future uploadimagesrealtor(int projectId, List files) async {
    FormData formData = FormData.fromMap({
      "images[]": files
          .map((item) => MultipartFile.fromFileSync(item.path,
              filename: item.path.split('/').last))
          .toList(),
      "projectID": projectId.toString()
    });
    final response =
        await dioClient.FormData(apiEnd: uploadimages_realtor, Data: formData);
    log("images = " + response.data.toString());
    log("projectID" + projectId.toString());
    log("images" + files.toString());
  }

  Future<String> uploadImage(
    BuildContext context,
    File files,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        "image": MultipartFile.fromFileSync(files.path,
            filename: files.path.split('/').last),
      });
      Response response =
          await dioClient.FormData(apiEnd: getImage, Data: formData);
      log("images = " + response.data.toString());
      // log("projectID" + projectId.toString());
      // log("images" + files.toString());
      return response.data['image'].toString();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Something Went to wrong!'),
        backgroundColor: teamRed,
      ));
      throw e;
    }
  }

  Future getrealtorproject(BuildContext contex) async {
    try {
      Response res = await dioClient.getRequest(apiEnd: realtorcustomerproject);
      listofrealtorproject = List<ProjectList>.from(
          res.data['data'].map((x) => ProjectList.fromJson(x)));
      log("response === " + res.toString());

      notifyListeners();
    } catch (e) {
      log("error ===" + e.toString());
      ScaffoldMessenger.of(contex).showSnackBar(SnackBar(
          content: Text('Something went to Wrong'),
          backgroundColor: Colors.red));
    }
  }

  Future gethousedata(
      {String? address,
      String? state,
      String? pincode,
      String? first_name,
      String? Last_name,
      String? ClientEmailAddress,
      String? streetNum,
      String? streetName,
      String? streetType,
      BuildContext? context}) async {
    Response res =
        await dioClient.getRequest(apiEnd: realtorhousedata, queryParameter: {
      "score": "100",
      "address": address ?? '7200 Oak Ave, River Forest, IL 60305, USA',
      "first_name": first_name ?? "test",
      'last_name': Last_name ?? "test",

      // "score": "100",
      // "state": state, // "mo",
      // "city": city, //"Kansas+City",
      // "zip_code": pincode, // 64114,
      // "first_name": first_name, //"test",
      // "last_name": Last_name, //"test",
      // // "client_email": ClientEmailAddress, 0//"test%40yopmail.com",
      // "streetNum": streetNum, //7200,
      // "streetName": streetName, //"oak",
      // "streetType": streetType, //"st"
      // "score": 100,
      // "state": state,
      // "city": city,
      // "zip_code": pincode,
      // "first_name": first_name,
      // "last_name": Last_name,
      // "client_email": ClientEmailAddress,
      // "streetNum": streetNum,
      // "streetName": streetName,
      // "streetType": streetType,
    });
    if (res.statusCode == 200) {
      housedata = Housedata.fromJson(res.data);
    } else {
      Navigator.of(context!).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Data Found for this house with this address")));
    }
    // log("lshjkbjk"+res.data.toString());
    notifyListeners();
  }

  Future changepassword({
    required String currentPassword,
    required int currentindex,
    required String newPassword,
    required String confirmPassword,
  }) async {
    // log("dbfdbfb " + currentindex.toString());
    Response res = await dioClient.PostwithFormData(
        apiEnd: currentindex == 0
            ? changepasswordrealtor
            : currentindex == 1
                ? changepasswordprofessional
                : changepasswordcustomer,
        Data: {
          "currentpassword": currentPassword,
          "password": newPassword,
          "password_confirmation": confirmPassword,
        });
    return res;
  }
}
