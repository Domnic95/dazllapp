// To parse this JSON data, do
//
//     final getProjectList = getProjectListFromJson(jsonString);

import 'dart:convert';

GetProjectList getProjectListFromJson(String str) =>
    GetProjectList.fromJson(json.decode(str));

String getProjectListToJson(GetProjectList data) => json.encode(data.toJson());

class GetProjectList {
  final List<ProjectList>? data;

  GetProjectList({
    this.data,
  });

  factory GetProjectList.fromJson(Map<String, dynamic> json) => GetProjectList(
        data: json["data"] == null
            ? []
            : List<ProjectList>.from(
                json["data"]!.map((x) => ProjectList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProjectList {
  final int? projectId;
  final List<dynamic>? projectOpertunity;
  final Customers? customer;
  final List<Roominfo>? roominfo;

  ProjectList({
    this.projectId,
    this.projectOpertunity,
    this.customer,
    this.roominfo,
  });

  factory ProjectList.fromJson(Map<String, dynamic> json) => ProjectList(
        projectId: json["project_id"],
        projectOpertunity: json["projectOpertunity"] == null
            ? []
            : List<dynamic>.from(json["projectOpertunity"]!.map((x) => x)),
        customer: json["customer"] == null
            ? null
            : Customers.fromJson(json["customer"]),
        roominfo: json["roominfo"] == null
            ? []
            : List<Roominfo>.from(
                json["roominfo"]!.map((x) => Roominfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "projectOpertunity": projectOpertunity == null
            ? []
            : List<dynamic>.from(projectOpertunity!.map((x) => x)),
        "customer": customer?.toJson(),
        "roominfo": roominfo == null
            ? []
            : List<dynamic>.from(roominfo!.map((x) => x.toJson())),
      };
}

class Customers {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final int? zipCode;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Customers({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.zipCode,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        zipCode: json["zip_code"],
        email: json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "zip_code": zipCode,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Roominfo {
  final int? roomId;
  final String? roomName;
  final List<Feature>? feature;

  Roominfo({
    this.roomId,
    this.roomName,
    this.feature,
  });

  factory Roominfo.fromJson(Map<String, dynamic> json) => Roominfo(
        roomId: json["room_id"],
        roomName: json["room_name"],
        feature: json["feature"] == null
            ? []
            : List<Feature>.from(
                json["feature"]!.map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "room_name": roomName,
        "feature": feature == null
            ? []
            : List<dynamic>.from(feature!.map((x) => x.toJson())),
      };
}

class Feature {
  final String? featureName;
  final String? featureoption;
  final int? featureId;
  final dynamic featureissue;
  final String? inspectionNotes;
  final String? status;
  final List<dynamic>? images;

  Feature({
    this.featureName,
    this.featureoption,
    this.featureId,
    this.featureissue,
    this.inspectionNotes,
    this.status,
    this.images,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        featureName: json["feature_name"],
        featureoption: json["featureoption"],
        featureId: json["feature_id"],
        featureissue: json["featureissue"],
        inspectionNotes: json["inspectionNotes"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "feature_name": featureName,
        "featureoption": featureoption,
        "feature_id": featureId,
        "featureissue": featureissue,
        "inspectionNotes": inspectionNotes,
        "status": status,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class FeatureissueElement {
  final int? id;
  final String? name;
  final int? featureOptionId;
  final int? featureId;
  final int? serviceTypeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FeatureissueElement({
    this.id,
    this.name,
    this.featureOptionId,
    this.featureId,
    this.serviceTypeId,
    this.createdAt,
    this.updatedAt,
  });

  factory FeatureissueElement.fromJson(Map<String, dynamic> json) =>
      FeatureissueElement(
        id: json["id"],
        name: json["name"],
        featureOptionId: json["feature_option_id"],
        featureId: json["feature_id"],
        serviceTypeId: json["service_type_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "feature_option_id": featureOptionId,
        "feature_id": featureId,
        "service_type_id": serviceTypeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
