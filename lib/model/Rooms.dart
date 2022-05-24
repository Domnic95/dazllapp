// To parse this JSON data, do
//
//     final rooms = roomsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, file_names

import 'dart:convert';

Rooms roomsFromJson(String str) => Rooms.fromJson(json.decode(str));

String roomsToJson(Rooms data) => json.encode(data.toJson());

class Rooms {
  Rooms({
    required this.success,
    required this.data,
  });

  bool success;
  List<Room> data;

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        success: json["success"],
        data: List<Room>.from(json["data"].map((x) => Room.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Room {
  Room(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.image});

  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: (json["images"] == null ? null : json["images"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "images": image == null ? null : image
      };
}
