// ignore_for_file: unused_local_variable, curly_braces_in_flow_control_structures


import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/model/FeatureOptionIssue.dart';
import 'package:dazllapp/model/Features.dart';
import 'package:dazllapp/model/Rooms.dart';

class CustomerNotifier extends BaseNotifier {
  List<Room> listOfRoom = [];
  List<RoomFeature> listOfFeature = [];
  List<FeatureoptionIssue> listOfFeatureOptionissues = [];
  List<FeatureOption> listOfoption = [];
  List<Featureissue> listOfissues = [];

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
    for (int c = 0; c < res.data['data'].length; c++) {
      for (int d = 0; d < res.data['data'][c]['feature_options'].length; d++) {
        for (int e = 0;
            e <
                res.data['data'][c]['feature_options'][d]['featureissues']
                    .length;
            e++) {
          listOfissues.add(Featureissue.fromJson(
              res.data['data'][c]['feature_options'][d]['featureissues'][e]));
        }
      }
    }
    notifyListeners();
  }
}
