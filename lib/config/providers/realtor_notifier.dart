import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/apicall.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/constant/colors.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/model/Realtor/filterProject.dart';
import 'package:dazllapp/model/Realtor/getComplitedPhd.dart';
import 'package:dazllapp/model/Realtor/getRoomFeature.dart';
import 'package:dazllapp/model/Realtor/housedata.dart';
import 'package:dazllapp/model/Realtor/realtor_customerlist.dart';

import 'package:dazllapp/model/Realtor/realtor_project.dart';
import 'package:dazllapp/model/Realtor/realtor_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class RealtorNotifier extends BaseNotifier {
  List<Customer> listofcustomers = [];
  List<String> flooringList = [];
  List<List<Roomtype>> roomTypes = [];
  List<List<AddValueData>> addValueData = [];
  List<ProjectList> listofrealtorproject = [];
  List<ProjectList> listofrealtorProjectLazyLoading = [];
  List<FilterProject> filterProjectList = [];
  GetComplitedPhdRealtor? singleComplitedPhdReport;
  GetComplitedPhdRealtor? complitedPhdReport;
  RealtorUser? realtorUser;
  Housedata? housedata;
  int lezyLoadingValue = 5;
  int sliderValue = 0;
  RealtorNotifier? realtorNotifier;
  //  List<List<List<List<String>>>>?  images = [
  //  ];
  final imgPicker = ImagePicker();

  Future<String> getImage1(
      BuildContext context, File image, WidgetRef ref) async {
    String img = await ref.read(realtorprovider).uploadImage(context, image);
    return img;
  }

  Future<void> setRealtorUser(String user) async {
    log("realtor ====== $user");
    realtorUser = RealtorUser.fromJson(jsonDecode(user));
  }

  Future getcustomers() async {
    final res = await dioClient.getRequest(apiEnd: customer);
    listofcustomers = List<Customer>.from(
        res.data['customer'].map((x) => Customer.fromJson(x)));
    notifyListeners();
  }

  Future<List<FilterProject>> filterProject() async {
    try {
      Response res = await dioClient.getRequest(apiEnd: filter_project);
      filterProjectList =
          List.from(res.data).map((e) => FilterProject.fromJson(e)).toList();
      filterProjectList.sort(
        (a, b) => b.id!.compareTo(a.id!),
      );
      notifyListeners();
      return filterProjectList;
    } catch (e) {
      log('error filterProject is =--= ' + e.toString());
      return [];
    }
  }

  Future getSingleComplitedPhd({required String id}) async {
    try {
      Response res =
          await dioClient.getRequest(apiEnd: single_complited_phd_realtor + id);

      log('${single_complited_phd_realtor + id}');
      singleComplitedPhdReport = GetComplitedPhdRealtor.fromJson(res.data);
      notifyListeners();
    } catch (e) {
      log('error is... getSingleComplitedPhd' + e.toString());
    }
  }

  Future getComplitedPhd() async {
    try {
      Response res = await dioClient.getRequest(apiEnd: complited_phd_realtor);

      complitedPhdReport = GetComplitedPhdRealtor.fromJson(res.data);

      // log('delte id is this --. ' +
      //     res.data['reports'][0]['project_id'].toString());
    } catch (e) {
      log('error is... getComplitedPhd' + e.toString());
    }
    notifyListeners();
  }

  Future updateBidStatus({
    required int projectId,
    required int featureId,
    required int roomId,
    required String bidStatus,
  }) async {
    Response res = await dioClient.patchwithRowData(
      apiEnd: '/statusUpdate/$projectId',
      queryParameter: {
        "feature_id": featureId,
        "room_id": roomId,
        "bid_status": bidStatus,
      },
    );
    if (res.statusCode == 200) {
      log("res ===== == ${res.data}");
      // await getRealtor(realtorId: realtorId);
    }
    notifyListeners();
    return res.data;
  }

  void reset() {
    roomTypes.clear();
    addValueData.clear();
  }

  Future getRoomFeature(int roomId) async {
    print("cndcndlcn   " + roomId.toString());
    Response res = await dioClient.getRequest(apiEnd: "$getroomfeature$roomId");
    print("cndcndlcn" + res.toString());
    roomTypes.insert(
        0,
        List.from(res.data["roomtype"] as List)
            .map((e) => Roomtype.fromJson(e))
            .toList());
    addValueData.insert(
        0,
        List.from(res.data["addValueData"] as List)
            .map((e) => AddValueData.fromJson(e))
            .toList());
    // print("cndcndlcn" + addValueData.first[0].name.toString());
    log("cndcndlcn" + addValueData.length.toString());
    notifyListeners();
  }

  Future<int> createprojectrealtor(List<Map<String, dynamic>> data) async {
    Response res = await dioClient.rawwithFormData(
        apiEnd: create_project_realtor, Data: data);

    log(res.toString());
    log("data  " + data.toString());
    return res.data['project_id'];
  }

  Future<int> updateprojectrealtor(Map<String, dynamic> data) async {
       log("data  " + data['projectID'].toString());
    Response res = await dioClient.rawwithFormData2(
        apiEnd: updateRealtor2, Data: data);

    log({res.statusCode}.toString());
    log("data  " + data.toString());
    log("res.data['project_id']  " + res.data.toString());
    return int.parse(res.data['project_id'].toString());
  }

  Future<Response> createPhdReport(Map<String, dynamic> data) async {
    log('data is --> ' + data.toString());
    Response res = await dioClient.PostwithFormData(
        apiEnd: create_phd_realtor, Data: data);
    log("Response === createPhdReport ${res.statusCode}");
    return res;
  }

  Future<Response> deletePhdReport(int projectId, BuildContext context) async {
    try {
      Response res = await dioClient.deletewithRowData(
          apiEnd: delete_phd_realtor + '/${projectId}');
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

  Future uploadimagesrealtor(int projectId, List files) async {
    var data = {
      "images[]": files
          .map((item) => MultipartFile.fromFileSync(item.path,
              filename: item.path.split('/').last))
          .toList(),
      "projectID": projectId.toString()
    };
    final response = await dioClient.PostwithFormData(
        apiEnd: uploadimages_realtor, Data: data);
    log("images = " + response.data.toString());
    log("projectID" + projectId.toString());
    log("images" + files.toString());
  }

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

  Future getrealtorproject(BuildContext contex) async {
    try {
      Response res = await dioClient.getRequest(apiEnd: realtorcustomerproject);
      listofrealtorproject = List<ProjectList>.from(
          res.data['data'].map((x) => ProjectList.fromJson(x)));

      // log("response === " + res.toString());
      listofrealtorproject.sort(
        (a, b) => b.projectId!.compareTo(a.projectId!),
      );
      log(">>>>>>>> ${listofrealtorproject.length}");
      log(">>>>>>>> ${listofrealtorproject.first.projectId}");
      // await loadDataForLazyLoading(firstTimeLoading: true);
      notifyListeners();
    } catch (e) {
      log("error ===" + e.toString());
      ScaffoldMessenger.of(contex).showSnackBar(SnackBar(
          content: Text('Something went to Wrong'),
          backgroundColor: Colors.red));
    }
  }

  loadDataForLazyLoading({required bool firstTimeLoading}) {
    bool dataIsOver = true;
    int forLoopValue = firstTimeLoading ? 0 : 5;

    for (var i = firstTimeLoading ? 0 : lezyLoadingValue;
        i < lezyLoadingValue + forLoopValue;
        i++) {
      if (listofrealtorproject.length >= i) {
        print('SSS ADD at -= ' + i.toString());
        listofrealtorProjectLazyLoading.add(listofrealtorproject[i]);
      } else {
        print('SSS Break');
        dataIsOver = false;
        break;
      }
    }
    if (dataIsOver) {
      lezyLoadingValue += 5;
    }
    print('SSS Length is =-=- ' + lezyLoadingValue.toString());
    if (!firstTimeLoading) notifyListeners();
  }

  Future gethousedata({
    String? address,
    String? state,
    String? pincode,
    String? first_name,
    String? Last_name,
    String? ClientEmailAddress,
    String? streetNum,
    String? streetName,
    String? streetType,
    BuildContext? context,
  }) async {
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
      toastShowError(context, "No Data Found for this house with this address");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: primaryColor,
      //     content: Text("No Data Found for this house with this address")));
    }
    // log("lshjkbjk"+res.data.toString());
    notifyListeners();
  }

  Future getRealtor({required int realtorId}) async {
    log("message=-=-=-");
    Response res = await dioClient.getRequest(
        apiEnd: get_realtor, queryParameter: {"realtor_id": realtorId});
    realtorUser = RealtorUser.fromJson(res.data);
    await SpHelpers.setString(
        SharedPrefsKeys.realtorUser, jsonEncode(realtorUser));
    return res.data;
  }

  Future updateRealtor(
      {required Map<String, dynamic> data, required int realtorId}) async {
    log("message1  ${realtorId}");
    Response res =
        await dioClient.patchwithRowData(apiEnd: update_realtor, Data: data);
    if (res.statusCode == 200) {
      log("res ===== === ${res.data}");
      await getRealtor(realtorId: realtorId);
    }
    return res.data;
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
