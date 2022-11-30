import 'dart:developer';

import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/model/Realtor/housedata.dart';

import 'package:dazllapp/model/Realtor/realtor_customerlist.dart';
import 'package:dazllapp/model/Realtor/realtor_project.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class realtorNotifier extends BaseNotifier {
  List<Customer> listofcustomers = [];
  List<ProjectList> listofrealtorproject = [];
  Housedata? housedata;

  Future getcustomers() async {
    final res = await dioClient.getRequest(apiEnd: customer);
    listofcustomers = List<Customer>.from(
        res.data['customer'].map((x) => Customer.fromJson(x)));
    notifyListeners();
  }

  Future<int> createprojectrealtor(List<Map<String, dynamic>> data) async {
    final res = await dioClient.rawwithFormData(
        apiEnd: create_project_realtor, Data: data);

    log(res.toString());
    log(data.toString());
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

  Future getrealtorproject() async {
    final res = await dioClient.getRequest(apiEnd: realtorcustomerproject);
    listofrealtorproject = List<ProjectList>.from(
        res.data['data'].map((x) => ProjectList.fromJson(x)));
    log(res.toString());

    notifyListeners();
  }

  Future gethousedata(
     { String? city,
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
      "state": state, // "mo",
      "city": city, //"Kansas+City",
      "zip_code": pincode, // 64114,
      "first_name": first_name, //"test",
      "last_name": Last_name, //"test",
      "client_email": ClientEmailAddress, //"test%40yopmail.com",
      "streetNum": streetNum, //7200,
      "streetName": streetName, //"oak",
      "streetType": streetType, //"st"
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
}
