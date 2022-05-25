import 'dart:convert';
import 'dart:developer';

import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/model/profile.dart';

class ProfessionalNotifier extends BaseNotifier {
  Profile profiles = Profile();
  Future getprofile() async {
    final res = await dioClient.getRequest(
        apiEnd: profile_url, queryParameter: {'professional_id': 2});
    profiles = Profile.fromJson(res.data);
    //   log(res.data.toString());
    notifyListeners();
  }
}
