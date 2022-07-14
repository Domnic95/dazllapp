
import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.data,
    });

    List<ProjectList>? data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: json["data"] == null ? null : List<ProjectList>.from(json["data"].map((x) => ProjectList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ProjectList {
    ProjectList({
        required this.projectId,
        required this.roominfo,
        required this.images,
    });

    int projectId;
    List<Roominfo>? roominfo;
    List<Image>? images;

    factory ProjectList.fromJson(Map<String, dynamic> json) => ProjectList(
        projectId: json["project_id"] == null ? null : json["project_id"],
        roominfo: json["roominfo"] == null ? null : List<Roominfo>.from(json["roominfo"].map((x) => Roominfo.fromJson(x))),
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "project_id": projectId == null ? null : projectId,
        "roominfo": roominfo == null ? null : List<dynamic>.from(roominfo!.map((x) => x.toJson())),
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
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
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        description: json["description"] == null ? null : json["description"],
        projectId: json["project_id"] == null ? null : json["project_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "description": description == null ? null : description,
        "project_id": projectId == null ? null : projectId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
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
    List<Feature>? feature;

    factory Roominfo.fromJson(Map<String, dynamic> json) => Roominfo(
        roomId: json["room_id"] == null ? null : json["room_id"],
        roomName: json["room_name"] == null ? null : json["room_name"],
        feature: json["feature"] == null ? null : List<Feature>.from(json["feature"].map((x) => Feature.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "room_id": roomId == null ? null : roomId,
        "room_name": roomName == null ? null : roomName,
        "feature": feature == null ? null : List<dynamic>.from(feature!.map((x) => x.toJson())),
    };
}

class Feature {
    Feature({
        required this.featureName,
        required this.featureoption,
        required this.featureissue,
        required this.inspectionNotes,
        required this.issuetext,
    });

    String featureName;
    String featureoption;
    List<Featureissue>? featureissue;
    String inspectionNotes;
    String issuetext;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        featureName: json["feature_name"] == null ? null : json["feature_name"],
        featureoption: json["featureoption"] == null ? null : json["featureoption"],
        featureissue: json["featureissue"] == null ? null : List<Featureissue>.from(json["featureissue"].map((x) => Featureissue.fromJson(x))),
        inspectionNotes: json["inspectionNotes"] == null ? null : json["inspectionNotes"],
        issuetext: json["issuetext"] == null ? null : json["issuetext"],
    );

    Map<String, dynamic> toJson() => {
        "feature_name": featureName == null ? null : featureName,
        "featureoption": featureoption == null ? null : featureoption,
        "featureissue": featureissue == null ? null : List<dynamic>.from(featureissue!.map((x) => x.toJson())),
        "inspectionNotes": inspectionNotes == null ? null : inspectionNotes,
        "issuetext": issuetext == null ? null : issuetext,
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
        featureOptionId: json["feature_option_id"] == null ? null : json["feature_option_id"],
        featureId: json["feature_id"] == null ? null : json["feature_id"],
        serviceTypeId: json["service_type_id"] == null ? null : json["service_type_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
