import 'dart:developer';

import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';

import 'package:dazllapp/model/Realtor/realtor_customerlist.dart';
import 'package:dazllapp/model/Realtor/realtor_project.dart';
import 'package:dio/dio.dart';

class realtorNotifier extends BaseNotifier {
  List<Customer> listofcustomers = [];
  List<ProjectList> listofrealtorproject = [];

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
}
