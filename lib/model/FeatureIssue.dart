// To parse this JSON data, do
//
//     final featureIssue = featureIssueFromJson(jsonString);

// ignore_for_file: file_names, unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

FeatureIssues featureIssueFromJson(String str) => FeatureIssues.fromJson(json.decode(str));

String featureIssueToJson(FeatureIssues data) => json.encode(data.toJson());

class FeatureIssues {
    FeatureIssues({
        required this.success,
        required this.data,
    });

    bool success;
    List<FeatureIssue> data;

    factory FeatureIssues.fromJson(Map<String, dynamic> json) => FeatureIssues(
        success: json["success"],
        data: List<FeatureIssue>.from(json["data"].map((x) => FeatureIssue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class FeatureIssue {
    FeatureIssue({
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
    DateTime createdAt;
    DateTime updatedAt;

    factory FeatureIssue.fromJson(Map<String, dynamic> json) => FeatureIssue(
        id: json["id"],
        name: json["name"],
        featureOptionId: json["feature_option_id"],
        featureId: json["feature_id"],
        serviceTypeId: json["service_type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "feature_option_id": featureOptionId,
        "feature_id": featureId,
        "service_type_id": serviceTypeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
