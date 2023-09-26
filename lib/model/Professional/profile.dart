// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

ProfileData profileDataFromJson(String str) =>
    ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
  Data? data;
  List<Servicetype>? servicetype;

  ProfileData({
    this.data,
    this.servicetype,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        data: Data.fromJson(json["data"]),
        servicetype: List<Servicetype>.from(
            json["servicetype"].map((x) => Servicetype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "servicetype": List<dynamic>.from(servicetype!.map((x) => x.toJson())),
      };
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? zipCode;
  String? token;
  String? companyName;
  String? companyStreetAddress;
  String? companyCity;
  String? state;
  String? type;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.zipCode,
    this.token,
    this.companyName,
    this.companyStreetAddress,
    this.companyCity,
    this.state,
    this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        zipCode: json["zip_code"],
        token: json["token"],
        companyName: json["company_name"],
        companyStreetAddress: json["company_street_address"],
        companyCity: json["company_city"],
        state: json["state"],
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
        "company_name": companyName,
        "company_street_address": companyStreetAddress,
        "company_city": companyCity,
        "state": state,
        "type": type,
      };
}

class Servicetype {
  int? serviceTypeId;
  int? professionalId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;

  Servicetype({
     this.serviceTypeId,
     this.professionalId,
     this.createdAt,
     this.updatedAt,
     this.service,
  });

  factory Servicetype.fromJson(Map<String, dynamic> json) => Servicetype(
        serviceTypeId: json["service_type_id"],
        professionalId: json["professional_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        service: Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "service_type_id": serviceTypeId,
        "professional_id": professionalId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "service": service!.toJson(),
      };
}

class Service {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  Service({
     this.id,
     this.name,
     this.createdAt,
     this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
