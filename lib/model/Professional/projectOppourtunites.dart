// To parse this JSON data, do
//
//     final projectOpportunities = projectOpportunitiesFromJson(jsonString);

import 'dart:convert';

ProjectOpportunities projectOpportunitiesFromJson(String str) =>
    ProjectOpportunities.fromJson(json.decode(str));

String projectOpportunitiesToJson(ProjectOpportunities data) =>
    json.encode(data.toJson());

class ProjectOpportunities {
  final Data? data;

  ProjectOpportunities({
    this.data,
  });

  factory ProjectOpportunities.fromJson(Map<String, dynamic> json) =>
      ProjectOpportunities(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final List<Final>? dataFinal;
  final List<Pro>? pro;
  final int? pages;

  Data({this.dataFinal, this.pro, this.pages});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      dataFinal: json["final"] == null
          ? []
          : List<Final>.from(json["final"]!.map((x) => Final.fromJson(x))),
      pro: json["pro"] == null
          ? []
          : List<Pro>.from(json["pro"]!.map((x) => Pro.fromJson(x))),
      pages: json["pages"] == null ? 0 : json["pages"]);

  Map<String, dynamic> toJson() => {
        "final": dataFinal == null
            ? []
            : List<dynamic>.from(dataFinal!.map((x) => x.toJson())),
        "pro":
            pro == null ? [] : List<dynamic>.from(pro!.map((x) => x.toJson())),
        "pages": pages
      };
}

class Final {
  final int? projectId;
  final DateTime? createdAt;
  final List<Roominfo>? roominfo;
  final List<Pro>? projectopportunities;
  final Customer? customer;

  Final({
    this.projectId,
    this.roominfo,
    this.createdAt,
    this.projectopportunities,
    this.customer,
  });

  factory Final.fromJson(Map<String, dynamic> json) => Final(
        projectId: json["project_id"],
        createdAt:json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        roominfo: json["roominfo"] == null
            ? []
            : List<Roominfo>.from(
                json["roominfo"]!.map((x) => Roominfo.fromJson(x))),
        projectopportunities: json["projectopportunities"] == null
            ? []
            : List<Pro>.from(
                json["projectopportunities"]!.map((x) => Pro.fromJson(x))),
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "created_at": createdAt,
        "roominfo": roominfo == null
            ? []
            : List<dynamic>.from(roominfo!.map((x) => x.toJson())),
        "projectopportunities": projectopportunities == null
            ? []
            : List<dynamic>.from(projectopportunities!.map((x) => x.toJson())),
        "customer": customer?.toJson(),
      };
}

class Customer {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final int? zipCode;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final House? house;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.zipCode,
    this.email,
    this.createdAt,
    this.updatedAt,
          this.house,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
            house: House.fromJson(json["house"] == null ? {}: json["house"]),
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
        "house": house?.toJson(),
      };
}


class House {
    int id;
    String name;
    int bathrooms;
    int bedrooms;
    String basement;
    String yearBuilt;
    String grossSize;
    String spaces;
    String parkingFeatures;
    String propertyStories;
    String structureType;
    String lotSize;
    String location;
    String foundationType;
    String taxAccessedValue;
    String annualTaxAmount;
    String saleDate;
    String saleAmount;
    String type;
    int realtorId;
    int customerId;
    String createdAt;
    String updatedAt;
    String address;

    House({
        required this.id,
        required this.name,
        required this.bathrooms,
        required this.bedrooms,
        required this.basement,
        required this.yearBuilt,
        required this.grossSize,
        required this.spaces,
        required this.parkingFeatures,
        required this.propertyStories,
        required this.structureType,
        required this.lotSize,
        required this.location,
        required this.foundationType,
        required this.taxAccessedValue,
        required this.annualTaxAmount,
        required this.saleDate,
        required this.saleAmount,
        required this.type,
        required this.realtorId,
        required this.customerId,
        required this.createdAt,
        required this.updatedAt,
        required this.address,
    });

    factory House.fromJson(Map<String, dynamic> json) => House(
        id: json["id"]== null ? 0 : json["id"],
        name: json["name"] == null? '': json["name"] ,
        bathrooms: json["bathrooms"] == null? 0:json["bathrooms"],
        bedrooms: json["bedrooms"] == null? 0:json["bedrooms"],
        basement: json["basement"] == null? '':json["basement"],
        yearBuilt: json["year_built"] == null? '':json["year_built"],
        grossSize: json["gross_size"] == null? '':json["gross_size"],
        spaces: json["spaces"] == null? '':json["spaces"],
        parkingFeatures: json["parking_features"] == null? '':json["parking_features"],
        propertyStories: json["property_stories"] == null? '':json["property_stories"],
        structureType: json["structure_type"] == null? '':json["structure_type"],
        lotSize: json["lot_size"] == null? '':json["lot_size"],
        location: json["location"] == null? '':json["location"],
        foundationType: json["foundation_type"] == null? '':json["foundation_type"],
        taxAccessedValue: json["tax_accessed_value"] == null? '':json["tax_accessed_value"],
        annualTaxAmount: json["annual_tax_amount"] == null? '':json["annual_tax_amount"],
        saleDate: json["sale_date"] == null? '':json["sale_date"],
        saleAmount: json["sale_amount"] == null? '':json["sale_amount"],
        type: json["type"] == null? '':json["type"],
        realtorId: json["realtor_id"] == null? 0:json["realtor_id"],
        customerId: json["customer_id"] == null? 0:json["customer_id"],
        createdAt: json["created_at"] == null? '':json["created_at"],
        updatedAt: json["updated_at"] == null? '':json["updated_at"],
        address: json["address"] == null? '':json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bathrooms": bathrooms,
        "bedrooms": bedrooms,
        "basement": basement,
        "year_built": yearBuilt,
        "gross_size": grossSize,
        "spaces": spaces,
        "parking_features": parkingFeatures,
        "property_stories": propertyStories,
        "structure_type": structureType,
        "lot_size": lotSize,
        "location": location,
        "foundation_type": foundationType,
        "tax_accessed_value": taxAccessedValue,
        "annual_tax_amount": annualTaxAmount,
        "sale_date": saleDate,
        "sale_amount": saleAmount,
        "type": type,
        "realtor_id": realtorId,
        "customer_id": customerId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "address": address,
    };
}

class Pro {
  final int? id;
  final String? message;
  final int? isInterested;
  final DateTime? interestDate;
  final int? projectId;
  final int? customerId;
  final int? professionalId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Pro({
    this.id,
    this.message,
    this.isInterested,
    this.interestDate,
    this.projectId,
    this.customerId,
    this.professionalId,
    this.createdAt,
    this.updatedAt,
  });

  factory Pro.fromJson(Map<String, dynamic> json) => Pro(
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
  final List<Featureissue>? featureissue;
  final String? inspectionNotes;
  final String? status;
  final List<String>? images;

  Feature({
    this.featureName,
    this.featureoption,
    this.featureissue,
    this.inspectionNotes,
    this.status,
    this.images,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        featureName: json["feature_name"],
        featureoption: json["featureoption"],
        featureissue: json["featureissue"] == null
            ? []
            : List<Featureissue>.from(json["featureissue"] == ""
                ? []
                : json["featureissue"]!.map((x) => Featureissue.fromJson(x))),
        inspectionNotes: json["inspectionNotes"] == null ? "": json["inspectionNotes"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "feature_name": featureName,
        "featureoption": featureoption,
        "featureissue": featureissue == null
            ? []
            : List<dynamic>.from(featureissue!.map((x) => x.toJson())),
        "inspectionNotes": inspectionNotes ?? "",
        "status": status,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class Featureissue {
  final int? id;
  final String? name;
  final int? featureOptionId;
  final int? featureId;
  final int? serviceTypeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ServiceType? serviceType;

  Featureissue({
    this.id,
    this.name,
    this.featureOptionId,
    this.featureId,
    this.serviceTypeId,
    this.createdAt,
    this.updatedAt,
    this.serviceType,
  });

  factory Featureissue.fromJson(Map<String, dynamic> json) => Featureissue(
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
        serviceType: json["service_type"] == null
            ? null
            : ServiceType.fromJson(json["service_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "feature_option_id": featureOptionId,
        "feature_id": featureId,
        "service_type_id": serviceTypeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "service_type": serviceType?.toJson(),
      };
}

class ServiceType {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ServiceType({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["id"],
        name: json["name"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
