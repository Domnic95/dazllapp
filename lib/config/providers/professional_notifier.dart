// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dazllapp/model/Professional/Services.dart';
import 'package:dazllapp/model/Professional/professional.dart';
import 'package:dazllapp/model/Professional/profile.dart';
import 'package:dazllapp/model/Professional/projectOppourtunites.dart';
import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProfessionalNotifier extends BaseNotifier {
  List<Datum> ServicesData = [];
  Profile profiles = Profile();
  ProfessionalData professionalData = ProfessionalData();
  ProjectOpportunities? projectOpportunities;
  List<Final> projectList = [];
  int _pageSize = 20;
  int get pageSize => _pageSize;

  Future getprofile() async {
    final res = await dioClient.getRequest(
        apiEnd: profile_url,
        queryParameter: {
          'professional_id': SpHelpers.getString(SharedPrefsKeys.Prof_id)
        });
    profiles = Profile.fromJson(res.data);
    SpHelpers.setString(SharedPrefsKeys.profetionalUser, jsonEncode(profiles));
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
        apiEnd: getprofessional,
        queryParameter: {
          "professional_id": SpHelpers.getString(SharedPrefsKeys.Prof_id)
        });
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

  Future getProjectOpportunities() async {
    Response res = await dioClient.getRequest(
      apiEnd: project_opportunities + "/1",
    );
    if (res.statusCode == 200) {
      projectOpportunities = ProjectOpportunities.fromJson(res.data);
      _pageSize = projectOpportunities!.data!.pages!;
      projectList = List.from(res.data['data']['final'])
          .map((e) => Final.fromJson(e))
          .toList();
    } else {
      // Navigator.of(context!).pop();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("No Data Found for this house with this address")));
    }
    // log("lshjkbjk"+res.data.toString());
    notifyListeners();
  }

  Future<List<Final>> getProjectOpportunitiesWithPagination(
      int pageIndex) async {
    try {
      String api = project_opportunities + "/" + pageIndex.toString();

      Response res = await dioClient.getRequest(
        apiEnd: api,
      );
      if (res.statusCode == 200) {
        if (pageIndex == 1) {
          projectOpportunities = ProjectOpportunities.fromJson(res.data);
        }
        projectList = List.from(res.data['data']['final'])
            .map((e) => Final.fromJson(e))
            .toList();

        return List.from(res.data['data']['final'])
            .map((e) => Final.fromJson(e))
            .toList();
      } else {
        return projectList;
        // Navigator.of(context!).pop();
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text("No Data Found for this house with this address")));
      }
    } catch (e) {
      log("error == " + e.toString());
      throw e;
    }
    // log("lshjkbjk"+res.data.toString());
  }

  Future updateProfessional(Map<String, dynamic> data) async {
    try {
      Response res = await dioClient.patchwithRowData(
          apiEnd: update_professional, Data: data);
      if (res.statusCode == 200) {
        getprofile();
        return res.data;
      }
    } catch (e) {
      throw e;
    }
  }

  Future sendProjectOpportunities(Map<String, dynamic> queryParameter) async {
    Response res = await dioClient.patchwithRowData(
      apiEnd: send_project_opportunities,
      queryParameter: queryParameter,
    );
    if (res.statusCode == 200) {
      return res.data;
    } else {
      return null;
      // Navigator.of(context!).pop();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("No Data Found for this house with this address")));
    }
    // log("lshjkbjk"+res.data.toString());
  }
}
