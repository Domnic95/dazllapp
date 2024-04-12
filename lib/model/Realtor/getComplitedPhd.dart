// To parse this JSON data, do
//
//     final getComplitedPhdRealtor = getComplitedPhdRealtorFromJson(jsonString);

import 'dart:convert';

GetComplitedPhdRealtor getComplitedPhdRealtorFromJson(String str) =>
    GetComplitedPhdRealtor.fromJson(json.decode(str));

String getComplitedPhdRealtorToJson(GetComplitedPhdRealtor data) =>
    json.encode(data.toJson());

class GetComplitedPhdRealtor {
  final List<Report>? reports;

  GetComplitedPhdRealtor({
    this.reports,
  });

  factory GetComplitedPhdRealtor.fromJson(Map<String, dynamic> json) =>
      GetComplitedPhdRealtor(
        reports: json["reports"] == null
            ? []
            : List<Report>.from(
                json["reports"]!.map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reports": reports == null
            ? []
            : List<dynamic>.from(reports!.map((x) => x.toJson())),
      };
}

class Report {
  final House? house;
  final int? projectId;
  final String? phdPrice;
  final String? prePrice;
  final dynamic bidStatus;
  final List<Image>? images;
  final List<Roominfo>? roominfo;
  final List<Roomtypedatum>? roomtypedata;
  final List<dynamic>? projectopportunities;
  final CustomerPhd? customer;

  Report({
    this.house,
    this.projectId,
    this.phdPrice,
    this.prePrice,
    this.bidStatus,
    this.images,
    this.roominfo,
    this.roomtypedata,
    this.projectopportunities,
    this.customer,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        house: json["house"] == null ? null : House.fromJson(json["house"]),
        projectId: json["project_id"] ?? '0',
        phdPrice: json["phd_price"] ?? '0',
        prePrice: json["pre_price"] ?? '',
        bidStatus: json["bid_status"] ?? '',
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        roominfo: json["roominfo"] == null
            ? []
            : List<Roominfo>.from(
                json["roominfo"]!.map((x) => Roominfo.fromJson(x))),
        roomtypedata: json["roomtypedata"] == null
            ? []
            : List<Roomtypedatum>.from(
                json["roomtypedata"]!.map((x) => Roomtypedatum.fromJson(x))),
        projectopportunities: json["projectopportunities"] == null
            ? []
            : List<dynamic>.from(json["projectopportunities"]!.map((x) => x)),
        customer: json["customer"] == null
            ? null
            : CustomerPhd.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "house": house?.toJson(),
        "project_id": projectId,
        "phd_price": phdPrice,
        "pre_price": prePrice,
        "bid_status": bidStatus,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "roominfo": roominfo == null
            ? []
            : List<dynamic>.from(roominfo!.map((x) => x.toJson())),
        "roomtypedata": roomtypedata == null
            ? []
            : List<dynamic>.from(roomtypedata!.map((x) => x.toJson())),
        "projectopportunities": projectopportunities == null
            ? []
            : List<dynamic>.from(projectopportunities!.map((x) => x)),
        "customer": customer?.toJson(),
      };
}

class CustomerPhd {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final int? zipCode;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerPhd({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.zipCode,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerPhd.fromJson(Map<String, dynamic> json) => CustomerPhd(
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

class House {
  final int? id;
  final String? name;
  final int? bathrooms;
  final int? bedrooms;
  final String? basement;
  final String? yearBuilt;
  final String? grossSize;
  final String? spaces;
  final String? parkingFeatures;
  final String? propertyStories;
  final String? structureType;
  final String? lotSize;
  final String? location;
  final String? foundationType;
  final String? taxAccessedValue;
  final String? annualTaxAmount;
  final String? saleDate;
  final String? saleAmount;
  final String? type;
  final int? realtorId;
  final int? customerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? address;

  House({
    this.id,
    this.name,
    this.bathrooms,
    this.bedrooms,
    this.basement,
    this.yearBuilt,
    this.grossSize,
    this.spaces,
    this.parkingFeatures,
    this.propertyStories,
    this.structureType,
    this.lotSize,
    this.location,
    this.foundationType,
    this.taxAccessedValue,
    this.annualTaxAmount,
    this.saleDate,
    this.saleAmount,
    this.type,
    this.realtorId,
    this.customerId,
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  factory House.fromJson(Map<String, dynamic> json) => House(
        id: json["id"],
        name: json["name"],
        bathrooms: json["bathrooms"],
        bedrooms: json["bedrooms"],
        basement: json["basement"],
        yearBuilt: json["year_built"],
        grossSize: json["gross_size"],
        spaces: json["spaces"],
        parkingFeatures: json["parking_features"],
        propertyStories: json["property_stories"],
        structureType: json["structure_type"],
        lotSize: json["lot_size"],
        location: json["location"],
        foundationType: json["foundation_type"],
        taxAccessedValue: json["tax_accessed_value"],
        annualTaxAmount: json["annual_tax_amount"],
        saleDate: json["sale_date"],
        saleAmount: json["sale_amount"],
        type: json["type"],
        realtorId: json["realtor_id"],
        customerId: json["customer_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        address: json["address"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "address": address,
      };
}

class Image {
  final int? id;
  final String? url;
  final String? description;
  final int? homeDiagnosticReportId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Image({
    this.id,
    this.url,
    this.description,
    this.homeDiagnosticReportId,
    this.createdAt,
    this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        description: json["description"] ?? '',
        homeDiagnosticReportId: json["home_diagnostic_report_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "description": description,
        "home_diagnostic_report_id": homeDiagnosticReportId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Roominfo {
  final int? roomId;
  final String? roomName;
  final dynamic flooringType;
  final String? status;
  final List<FeatureOptionsElement>? additional;
  final List<FeatureElement>? feature;

  Roominfo({
    this.roomId,
    this.roomName,
    this.flooringType,
    this.status,
    this.additional,
    this.feature,
  });

  factory Roominfo.fromJson(Map<String, dynamic> json) => Roominfo(
        roomId: json["room_id"],
        roomName: json["room_name"],
        flooringType: json["flooring_type"],
        status: json["status"],
        additional: json["additional"] == null
            ? []
            : List<FeatureOptionsElement>.from(json["additional"]!
                .map((x) => FeatureOptionsElement.fromJson(x))),
        feature: json["feature"] == null
            ? []
            : List<FeatureElement>.from(
                json["feature"]!.map((x) => FeatureElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "room_name": roomName,
        "flooring_type": flooringType,
        "status": status,
        "additional": additional == null
            ? []
            : List<dynamic>.from(additional!.map((x) => x.toJson())),
        "feature": feature == null
            ? []
            : List<dynamic>.from(feature!.map((x) => x.toJson())),
      };
}

class FeatureOptionsElement {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? featureId;

  FeatureOptionsElement({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.featureId,
  });

  factory FeatureOptionsElement.fromJson(Map<String, dynamic> json) =>
      FeatureOptionsElement(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "feature_id": featureId,
      };
}

class FeatureElement {
  final String? featureName;
  final int? featureId;
  late final String? bidStatus;
  final String? featureoption;
  final String? featureissue;
  final String? inspectionNotes;
  final String? imageDesc;
  final List<String>? images;

  FeatureElement({
    this.featureName,
    this.featureId,
    this.bidStatus,
    this.featureoption,
    this.featureissue,
    this.inspectionNotes,
    this.imageDesc,
    this.images,
  });

  factory FeatureElement.fromJson(Map<String, dynamic> json) => FeatureElement(
        featureName: json["feature_name"],
        featureId: json["feature_id"],
        bidStatus: json["bid_status"],
        featureoption: json["featureoption"],
        featureissue: json["featureissue"],
        inspectionNotes: json["inspectionNotes"],
        imageDesc: json["imageDesc"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x ?? '')),
      );

  Map<String, dynamic> toJson() => {
        "feature_name": featureName,
        "feature_id": featureId,
        "bid_status": bidStatus,
        "featureoption": featureoption,
        "featureissue": featureissue,
        "inspectionNotes": inspectionNotes,
        "imageDesc": imageDesc,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class Roomtypedatum {
  final int? id;
  final int? roomId;
  final int? projectId;
  final int? subTypeId;
  final int? typeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FeatureOptionsClass? featureOptions;
  final FeatureOptionsClass? feature;

  Roomtypedatum({
    this.id,
    this.roomId,
    this.projectId,
    this.subTypeId,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.featureOptions,
    this.feature,
  });

  factory Roomtypedatum.fromJson(Map<String, dynamic> json) => Roomtypedatum(
        id: json["id"],
        roomId: json["room_id"],
        projectId: json["project_id"],
        subTypeId: json["sub_type_id"],
        typeId: json["type_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        featureOptions: json["feature_options"] == null
            ? null
            : FeatureOptionsClass.fromJson(json["feature_options"]),
        feature: json["feature"] == null
            ? null
            : FeatureOptionsClass.fromJson(json["feature"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_id": roomId,
        "project_id": projectId,
        "sub_type_id": subTypeId,
        "type_id": typeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "feature_options": featureOptions?.toJson(),
        "feature": feature?.toJson(),
      };
}

class FeatureOptionsClass {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? featureId;

  FeatureOptionsClass({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.featureId,
  });

  factory FeatureOptionsClass.fromJson(Map<String, dynamic> json) =>
      FeatureOptionsClass(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "feature_id": featureId,
      };
}
