// To parse this JSON data, do
//
//     final myproject = myprojectFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// Myproject myprojectFromJson(String str) => Myproject.fromJson(json.decode(str));

// String myprojectToJson(Myproject data) => json.encode(data.toJson());

// class Myproject {
//   Myproject({
//     required this.data,
//   });

//   List<Project>? data;

//   factory Myproject.fromJson(Map<String, dynamic> json) => Myproject(
//         data: json["data"] == null
//             ? null
//             : List<Project>.from(json["data"].map((x) => Project.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data == null
//             ? null
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Project {
//   Project({
//     required this.projectId,
//     required this.roominfo,
//     required this.images,
//     required this.customer,
//   });

//   int projectId;
//   List<Roominfo>? roominfo;
//   List<Image>? images;
//   dynamic customer;

//   factory Project.fromJson(Map<String, dynamic> json) => Project(
//         projectId: json["project_id"] == null ? null : json["project_id"],
//         roominfo: json["roominfo"] == null
//             ? null
//             : List<Roominfo>.from(
//                 json["roominfo"].map((x) => Roominfo.fromJson(x))),
//         images: json["images"] == null
//             ? null
//             : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//         customer: json["customer"] == null ? null : json["customer"],
//       );

//   Map<String, dynamic> toJson() => {
//         "project_id": projectId == null ? null : projectId,
//         "customer": customer == null ? null : customer,
//         "roominfo": roominfo == null
//             ? null
//             : List<dynamic>.from(roominfo!.map((x) => x.toJson())),
//         "images": images == null
//             ? null
//             : List<dynamic>.from(images!.map((x) => x.toJson())),
//       };
// }

// class Image {
//   Image({
//     required this.id,
//     required this.url,
//     required this.description,
//     required this.projectId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   String url;
//   String description;
//   int projectId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"] == null ? null : json["id"],
//         url: json["url"] == null ? null : json["url"],
//         description: json["description"] == null ? null : json["description"],
//         projectId: json["project_id"] == null ? null : json["project_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "url": url == null ? null : url,
//         "description": description == null ? null : description,
//         "project_id": projectId == null ? null : projectId,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//       };
// }

// class Roominfo {
//   Roominfo({
//     required this.roomId,
//     required this.roomName,
//     required this.feature,
//   });

//   int roomId;
//   String roomName;
//   List<Featureinfo>? feature;

//   factory Roominfo.fromJson(Map<String, dynamic> json) => Roominfo(
//         roomId: json["room_id"] == null ? null : json["room_id"],
//         roomName: json["room_name"] == null ? null : json["room_name"],
//         feature: json["feature"] == null
//             ? null
//             : List<Featureinfo>.from(
//                 json["feature"].map((x) => Featureinfo.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "room_id": roomId == null ? null : roomId,
//         "room_name": roomName == null ? null : roomName,
//         "feature": feature == null
//             ? null
//             : List<dynamic>.from(feature!.map((x) => x.toJson())),
//       };
// }

// class Featureinfo {
//   Featureinfo({
//     required this.featureName,
//     required this.featureoption,
//     required this.featureissue,
//     required this.inspectionNotes,
//     required this.issuetext,
//   });

//   String featureName;
//   String featureoption;
//   List<FeatureIssue>? featureissue;
//   String inspectionNotes;
//   String issuetext;

//   factory Featureinfo.fromJson(Map<String, dynamic> json) => Featureinfo(
//         featureName: json["feature_name"] == null ? null : json["feature_name"],
//         featureoption:
//             json["featureoption"] == null ? [] : json["featureoption"],
//         featureissue: json["featureissue"] == null
//             ? []
//             : List<FeatureIssue>.from(
//                 json["featureissue"].map((x) => FeatureIssue.fromJson(x))),
//         inspectionNotes:
//             json["inspectionNotes"] == null ? null : json["inspectionNotes"],
//         issuetext: json["issuetext"] == null ? null : json["issuetext"],
//       );

//   Map<String, dynamic> toJson() => {
//         "feature_name": featureName == null ? null : featureName,
//         "featureoption": featureoption == null ? null : featureoption,
//         "featureissue": featureissue == null
//             ? null
//             : List<dynamic>.from(featureissue!.map((x) => x.toJson())),
//         "inspectionNotes": inspectionNotes == null ? null : inspectionNotes,
//         "issuetext": issuetext == null ? null : issuetext,
//       };
// }

// class FeatureIssue {
//   FeatureIssue({
//     required this.id,
//     required this.name,
//     required this.featureOptionId,
//     required this.featureId,
//     required this.serviceTypeId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   String name;
//   int featureOptionId;
//   int featureId;
//   int serviceTypeId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory FeatureIssue.fromJson(Map<String, dynamic> json) => FeatureIssue(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         featureOptionId: json["feature_option_id"] == null
//             ? null
//             : json["feature_option_id"],
//         featureId: json["feature_id"] == null ? null : json["feature_id"],
//         serviceTypeId:
//             json["service_type_id"] == null ? null : json["service_type_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "feature_option_id": featureOptionId == null ? null : featureOptionId,
//         "feature_id": featureId == null ? null : featureId,
//         "service_type_id": serviceTypeId == null ? null : serviceTypeId,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//       };
// }

// To parse this JSON data, do
//
//     final myproject = myprojectFromJson(jsonString);

import 'dart:convert';

Myproject myprojectFromJson(String str) => Myproject.fromJson(json.decode(str));

String myprojectToJson(Myproject data) => json.encode(data.toJson());

class Myproject {
  final List<Project>? data;

  Myproject({
    this.data,
  });

  factory Myproject.fromJson(Map<String, dynamic> json) => Myproject(
        data: json["data"] == null
            ? []
            : List<Project>.from(json["data"]!.map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Project {
  final int? projectId;
  final List<ProjectOpertunity>? projectOpertunity;
  final dynamic customer;
  final List<Roominfo>? roominfo;

  Project({
    this.projectId,
    this.projectOpertunity,
    this.customer,
    this.roominfo,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        projectId: json["project_id"],
        projectOpertunity: json["projectOpertunity"] == null
            ? []
            : List<ProjectOpertunity>.from(json["projectOpertunity"]!
                .map((x) => ProjectOpertunity.fromJson(x))),
        customer: json["customer"],
        roominfo: json["roominfo"] == null
            ? []
            : List<Roominfo>.from(
                json["roominfo"]!.map((x) => Roominfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "projectOpertunity": projectOpertunity == null
            ? []
            : List<dynamic>.from(projectOpertunity!.map((x) => x.toJson())),
        "customer": customer,
        "roominfo": roominfo == null
            ? []
            : List<dynamic>.from(roominfo!.map((x) => x.toJson())),
      };
}

class ProjectOpertunity {
  final int? id;
  final String? message;
  final int? isInterested;
  final DateTime? interestDate;
  final int? projectId;
  final int? customerId;
  final int? professionalId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Professional? professional;

  ProjectOpertunity({
    this.id,
    this.message,
    this.isInterested,
    this.interestDate,
    this.projectId,
    this.customerId,
    this.professionalId,
    this.createdAt,
    this.updatedAt,
    this.professional,
  });

  factory ProjectOpertunity.fromJson(Map<String, dynamic> json) =>
      ProjectOpertunity(
        id: json["id"],
        message: json["message"],
        isInterested: json["isInterested"],
        interestDate: json["interest_date"] == null
            ? null
            : DateTime.parse(json["interest_date"]),
        projectId: json["project_id"],
        customerId: json["customer_id"],
        professionalId: json["professional_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        professional: json["professional"] == null
            ? null
            : Professional.fromJson(json["professional"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "isInterested": isInterested,
        "interest_date":
            "${interestDate!.year.toString().padLeft(4, '0')}-${interestDate!.month.toString().padLeft(2, '0')}-${interestDate!.day.toString().padLeft(2, '0')}",
        "project_id": projectId,
        "customer_id": customerId,
        "professional_id": professionalId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "professional": professional?.toJson(),
      };
}

class Professional {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? companyName;
  final String? companyStreetAddress;
  final String? companyCity;
  final int? zipCode;
  final String? state;
  final int? companyId;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Professional({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.companyName,
    this.companyStreetAddress,
    this.companyCity,
    this.zipCode,
    this.state,
    this.companyId,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory Professional.fromJson(Map<String, dynamic> json) => Professional(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        companyName: json["company_name"],
        companyStreetAddress: json["company_street_address"],
        companyCity: json["company_city"],
        zipCode: json["zip_code"],
        state: json["state"],
        companyId: json["company_id"],
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
        "company_name": companyName,
        "company_street_address": companyStreetAddress,
        "company_city": companyCity,
        "zip_code": zipCode,
        "state": state,
        "company_id": companyId,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Roominfo {
  final int? roomId;
  final String? roomName;
  final List<Featureinfo>? feature;

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
            : List<Featureinfo>.from(
                json["feature"]!.map((x) => Featureinfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "room_name": roomName,
        "feature": feature == null
            ? []
            : List<dynamic>.from(feature!.map((x) => x.toJson())),
      };
}

class Featureinfo {
  final String? featureName;
  final String? featureoption;
  final int? featureId;
  final dynamic featureissue;
  final String? inspectionNotes;
  final String? status;
  final List<dynamic>? images;

  Featureinfo({
    this.featureName,
    this.featureoption,
    this.featureissue,
    this.featureId,
    this.inspectionNotes,
    this.status,
    this.images,
  });

  factory Featureinfo.fromJson(Map<String, dynamic> json) => Featureinfo(
        featureName: json["feature_name"],
        featureoption: json["featureoption"],
        featureissue: json["featureissue"],
        inspectionNotes: json["inspectionNotes"],
        featureId: json["feature_id"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "feature_name": featureName,
        "featureoption": featureoption,
        "featureissue": featureissue,
        "inspectionNotes": inspectionNotes,
        "feature_id": featureId,
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
