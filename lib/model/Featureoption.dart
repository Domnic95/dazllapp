// To parse this JSON data, do
//
//     final featureoption = featureoptionFromJson(jsonString);

// ignore_for_file: file_names, unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

Feature featureoptionFromJson(String str) => Feature.fromJson(json.decode(str));

String featureoptionToJson(Feature data) => json.encode(data.toJson());

class Feature {
    Feature({
        required this.success,
        required this.data,
    });

    bool success;
    List<Featureoption> data;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        success: json["success"],
        data: List<Featureoption>.from(json["data"].map((x) => Featureoption.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Featureoption {
    Featureoption({
        required this.id,
        required this.name,
        required this.featureId,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    int featureId;
    DateTime createdAt;
    DateTime updatedAt;

    factory Featureoption.fromJson(Map<String, dynamic> json) => Featureoption(
        id: json["id"],
        name: json["name"],
        featureId: json["feature_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "feature_id": featureId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
