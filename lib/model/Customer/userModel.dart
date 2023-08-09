// To parse this JSON data, do
//
//     final customerUserModel = customerUserModelFromJson(jsonString);

import 'dart:convert';

CustomerUserModel customerUserModelFromJson(String str) =>
    CustomerUserModel.fromJson(json.decode(str));

String customerUserModelToJson(CustomerUserModel data) =>
    json.encode(data.toJson());

class CustomerUserModel {
  final CustomerUserData? data;

  CustomerUserModel({
    this.data,
  });

  factory CustomerUserModel.fromJson(Map<String, dynamic> json) =>
      CustomerUserModel(
        data: json["data"] == null ? null : CustomerUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class CustomerUserData {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final int? zipCode;
  final String? token;
  final String? type;

  CustomerUserData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.zipCode,
    this.token,
    this.type,
  });

  factory CustomerUserData.fromJson(Map<String, dynamic> json) => CustomerUserData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        zipCode: json["zip_code"],
        token: json["token"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "zip_code": zipCode,
        "token": token,
        "type": type,
      };
}
