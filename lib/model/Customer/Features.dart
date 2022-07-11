// To parse this JSON data, do
//     final feature = featureFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

Feature featureFromJson(String str) => Feature.fromJson(json.decode(str));

String featureToJson(Feature data) => json.encode(data.toJson());

class Feature {
  Feature({
    required this.success,
    required this.data,
  });

  bool success;
  List<RoomFeature> data;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        success: json["success"],
        data: List<RoomFeature>.from(
            json["data"].map((x) => RoomFeature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RoomFeature {
  RoomFeature({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory RoomFeature.fromJson(Map<String, dynamic> json) => RoomFeature(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
