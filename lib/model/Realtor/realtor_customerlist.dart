// To parse this JSON data, do
//
//     final myproject = myprojectFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Myproject myprojectFromJson(String str) => Myproject.fromJson(json.decode(str));

String myprojectToJson(Myproject data) => json.encode(data.toJson());

class Myproject {
  Myproject({
    required this.customer,
  });

  List<Customer>? customer;

  factory Myproject.fromJson(Map<String, dynamic> json) => Myproject(
        customer: json["customer"] == null
            ? null
            : List<Customer>.from(
                json["customer"].map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer == null
            ? null
            : List<dynamic>.from(customer!.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.zipCode,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name = "Select Customer";
  String firstName;
  String lastName;
  String phoneNumber;
  int zipCode;
  String email;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        zipCode: json["zip_code"] == null ? null : json["zip_code"],
        email: json["email"] == null ? null : json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "zip_code": zipCode == null ? null : zipCode,
        "email": email == null ? null : email,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
