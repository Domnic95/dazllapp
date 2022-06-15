// To parse this JSON data, do
//
//     final myproject = myprojectFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Myproject myprojectFromJson(String str) => Myproject.fromJson(json.decode(str));

String myprojectToJson(Myproject data) => json.encode(data.toJson());

class Myproject {
  Myproject({
    required this.data,
  });

  List<Project> data;

  factory Myproject.fromJson(Map<String, dynamic> json) => Myproject(
        data: List<Project>.from(json["data"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<Project>.from(data.map((x) => x.toJson())),
      };
}

class Project {
  Project({
    required this.projectId,
    required this.roominfo,
    required this.images,
  });

  int projectId;
  List<Roominfo> roominfo;
  List<Image> images;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        projectId: json["project_id"],
        roominfo: List<Roominfo>.from(
            json["roominfo"].map((x) => Roominfo.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "roominfo": List<dynamic>.from(roominfo.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.id,
    required this.url,
    required this.description,
    required this.projectId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String url;
  String description;
  int projectId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        description: json["description"],
        projectId: json["project_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "description": description,
        "project_id": projectId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Roominfo {
  Roominfo({
    required this.roomId,
    required this.roomName,
    required this.feature,
  });

  int roomId;
  String roomName;
  List<Featureinfo> feature;

  factory Roominfo.fromJson(Map<String, dynamic> json) => Roominfo(
        roomId: json["room_id"],
        roomName: json["room_name"],
        feature: List<Featureinfo>.from(
            json["feature"].map((x) => Featureinfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "room_name": roomName,
        "feature": List<dynamic>.from(feature.map((x) => x.toJson())),
      };
}

class Featureinfo {
  Featureinfo({
    required this.featureName,
    required this.featureoption,
    required this.featureissue,
    required this.inspectionNotes,
    required this.issuetext,
  });

  String featureName;
  String featureoption;
  String featureissue;
  String inspectionNotes;
  String issuetext;

  factory Featureinfo.fromJson(Map<String, dynamic> json) => Featureinfo(
        featureName: json["feature_name"],
        featureoption: json["featureoption"],
        featureissue: json["featureissue"],
        inspectionNotes: json["inspectionNotes"],
        issuetext: json["issuetext"],
      );

  Map<String, dynamic> toJson() => {
        "feature_name": featureName,
        "featureoption": featureoption,
        "featureissue": featureissue,
        "inspectionNotes": inspectionNotes,
        "issuetext": issuetext,
      };
}
