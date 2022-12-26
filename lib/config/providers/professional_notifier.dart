// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/model/Professional/Services.dart';
import 'package:dazllapp/model/Professional/professional.dart';
import 'package:dazllapp/model/Professional/profile.dart';
import 'package:dio/dio.dart';

class ProfessionalNotifier extends BaseNotifier {
  List<Datum> ServicesData = [];
  Profile profiles = Profile();
  ProfessionalData professionalData = ProfessionalData();
  Future getprofile() async {
    final res = await dioClient.getRequest(
        apiEnd: profile_url,
        queryParameter: {
          'professional_id': SpHelpers.getString(SharedPrefsKeys.Prof_id)
        });
    profiles = Profile.fromJson(res.data);

    // log("Pro Id=" + SpHelpers.getString(SharedPrefsKeys.Prof_id).toString());
    notifyListeners();
  }

  Future getServices() async {
    Response res = await dioClient.getRequest(
      apiEnd: getService,
    );
    if (res.statusCode == 200) {
      ServicesData =
          List.from(res.data['data']).map((e) => Datum.fromJson(e)).toList();
    } else {
      // Navigator.of(context!).pop();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("No Data Found for this house with this address")));
    }
    // log("lshjkbjk"+res.data.toString());
    notifyListeners();
  }

  Future getProfessional() async {
    Response res = await dioClient.getRequest(
        apiEnd: getprofessional, queryParameter: {"professional_id": "75"});
    if (res.statusCode == 200) {
      professionalData = ProfessionalData.fromJson(res.data);
    } else {
      // Navigator.of(context!).pop();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("No Data Found for this house with this address")));
    }
    // log("lshjkbjk"+res.data.toString());
    notifyListeners();
  }
}
