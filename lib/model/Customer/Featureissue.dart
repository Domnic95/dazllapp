// To parse this JSON data, do
//
//     final myproject = myprojectFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Myproject myprojectFromJson(String str) => Myproject.fromJson(json.decode(str));

String myprojectToJson(Myproject data) => json.encode(data.toJson());

class Myproject {
  Myproject({
    required this.success,
    required this.data,
  });

  bool success;
  List<Featureissue>? data;

  factory Myproject.fromJson(Map<String, dynamic> json) => Myproject(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null
            ? null
            : List<Featureissue>.from(json["data"].map((x) => Featureissue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Featureissue {
  Featureissue({
    required this.id,
    required this.name,
    required this.featureOptionId,
    required this.featureId,
    required this.serviceTypeId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int featureOptionId;
  int featureId;
  int serviceTypeId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Featureissue.fromJson(Map<String, dynamic> json) => Featureissue(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        featureOptionId: json["feature_option_id"] == null
            ? null
            : json["feature_option_id"],
        featureId: json["feature_id"] == null ? null : json["feature_id"],
        serviceTypeId:
            json["service_type_id"] == null ? null : json["service_type_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "feature_option_id": featureOptionId == null ? null : featureOptionId,
        "feature_id": featureId == null ? null : featureId,
        "service_type_id": serviceTypeId == null ? null : serviceTypeId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
