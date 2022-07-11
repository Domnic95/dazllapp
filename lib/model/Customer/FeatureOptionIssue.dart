// To parse this JSON data, do
//
//     final featureoption = featureoptionFromJson(jsonString);

// ignore_for_file: file_names, unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

Featureoption featureoptionFromJson(String str) =>
    Featureoption.fromJson(json.decode(str));

String featureoptionToJson(Featureoption data) => json.encode(data.toJson());

class Featureoption {
  Featureoption({
    required this.success,
    required this.data,
  });

  bool success;
  List<FeatureoptionIssue> data;

  factory Featureoption.fromJson(Map<String, dynamic> json) => Featureoption(
        success: json["success"],
        data: List<FeatureoptionIssue>.from(
            json["data"].map((x) => FeatureoptionIssue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FeatureIssue {
  FeatureIssue({
    required this.id,
    required this.iid,
    required this.name,
    required this.featureOptionId,
    required this.featureId,
    required this.serviceTypeId,
    required this.createdAt,
    required this.updatedAt,
    required this.serviceType,
  });

  int id;
  String iid;
  String name;
  int featureOptionId;
  int featureId;
  int serviceTypeId;
  DateTime createdAt;
  DateTime updatedAt;
  FeatureoptionIssue serviceType;

  factory FeatureIssue.fromJson(Map<String, dynamic> json) => FeatureIssue(
        id: json["id"],
        iid: json["id"].toString(),
        name: json["name"],
        featureOptionId: json["feature_option_id"],
        featureId: json["feature_id"],
        serviceTypeId: json["service_type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceType: FeatureoptionIssue.fromJson(json["service_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "feature_option_id": featureOptionId,
        "feature_id": featureId,
        "service_type_id": serviceTypeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service_type": serviceType.toJson(),
      };
}

class FeatureOption {
  FeatureOption(
      {required this.id,
      required this.iid,
      required this.name,
      required this.featureId,
      required this.createdAt,
      required this.updatedAt,
      required this.featureissues,
      required this.featureBoolList});

  int id;
  String iid;
  String name;
  int featureId;
  DateTime createdAt;
  DateTime updatedAt;
  List<FeatureIssue> featureissues;
  List<bool> featureBoolList;

  factory FeatureOption.fromJson(Map<String, dynamic> json) {
    List<bool> fake = [];
    for (int i = 0; i < json["featureissues"].length; i++) {
      fake.add(false);
    }
    return FeatureOption(
      id: json["id"],
      name: json["name"],
      featureId: json["feature_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      featureBoolList: fake,
      featureissues: List<FeatureIssue>.from(
          json["featureissues"].map((x) => FeatureIssue.fromJson(x))),
      iid: json["id"].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "feature_id": featureId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "featureissues":
            List<dynamic>.from(featureissues.map((x) => x.toJson())),
      };
}

class FeatureoptionIssue {
  FeatureoptionIssue({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.featureOptions,
  });

  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<FeatureOption>? featureOptions;

  factory FeatureoptionIssue.fromJson(Map<String, dynamic> json) =>
      FeatureoptionIssue(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        featureOptions: json["feature_options"] == null
            ? null
            : List<FeatureOption>.from(
                json["feature_options"].map((x) => FeatureOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "feature_options": featureOptions == null
            ? null
            : List<dynamic>.from(featureOptions!.map((x) => x.toJson())),
      };
}
