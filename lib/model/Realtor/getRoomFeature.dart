// To parse this JSON data, do
//
//     final getRoomFeature = getRoomFeatureFromJson(jsonString);

import 'dart:convert';

import 'package:dazllapp/model/Customer/Features.dart';
import 'package:flutter/material.dart';

GetRoomFeature getRoomFeatureFromJson(String str) =>
    GetRoomFeature.fromJson(json.decode(str));

String getRoomFeatureToJson(GetRoomFeature data) => json.encode(data.toJson());

class GetRoomFeature {
  final bool? success;
  final List<RoomFeature>? data;
  final List<AddValueData>? addValueData;
  final List<Roomtype>? roomtype;
  TextEditingController? singleTabController;
  List<String>? images = [];
  String? impressions = '';
  int? roomId = -1;

  GetRoomFeature({
    this.success,
    this.data,
    this.addValueData,
    this.roomtype,
    this.singleTabController,
    this.images,
    this.impressions,
    this.roomId,
  });

  factory GetRoomFeature.fromJson(Map<String, dynamic> json) => GetRoomFeature(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<RoomFeature>.from(
                json["data"]!.map((x) => RoomFeature.fromJson(x))),
        addValueData: json["addValueData"] == null
            ? []
            : List<AddValueData>.from(
                json["addValueData"]!.map((x) => AddValueData.fromJson(x))),
        roomtype: json["roomtype"] == null
            ? []
            : List<Roomtype>.from(
                json["roomtype"]!.map((x) => Roomtype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "addValueData": addValueData == null
            ? []
            : List<dynamic>.from(addValueData!.map((x) => x.toJson())),
        "roomtype": roomtype == null
            ? []
            : List<dynamic>.from(roomtype!.map((x) => x.toJson())),
      };
}

class AddValueData {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<AddValueData>? featureOptions;
  final int? featureId;
  bool? optionSelected = false;

  AddValueData({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.featureOptions,
    this.featureId,
    this.optionSelected,
  });

  factory AddValueData.fromJson(Map<String, dynamic> json) => AddValueData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        featureOptions: json["feature_options"] == null
            ? []
            : List<AddValueData>.from(
                json["feature_options"]!.map((x) => AddValueData.fromJson(x))),
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "feature_options": featureOptions == null
            ? []
            : List<dynamic>.from(featureOptions!.map((x) => x.toJson())),
        "feature_id": featureId,
      };
}

class Roomtype {
  final int? id;
  final int? typeId;
  final int? roomId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AddValueData? type;
  int? selectedDropDown = -1;
  String? selectedtype = '';

  Roomtype({
    this.id,
    this.typeId,
    this.roomId,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.selectedDropDown,
    this.selectedtype,
  });

  factory Roomtype.fromJson(Map<String, dynamic> json) => Roomtype(
        id: json["id"],
        typeId: json["type_id"],
        roomId: json["room_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        type: json["type"] == null ? null : AddValueData.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "room_id": roomId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "type": type?.toJson(),
      };
}
