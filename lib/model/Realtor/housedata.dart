// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

Housedata userdataFromJson(String str) => Housedata.fromJson(json.decode(str));

String userdataToJson(Housedata data) => json.encode(data.toJson());

class Housedata {
    Housedata({
        this.type,
        this.yearBuilt,
        this.bedrooms,
        this.bathrooms,
        this.structureType,
        this.lotSize,
        this.location,
        this.foundationType,
        this.taxAccessedValue,
        this.saleDate,
    });

    String? type;
    int? yearBuilt;
    int? bedrooms;
    int? bathrooms;
    String? structureType;
    int? lotSize;
    String? location;
    String? foundationType;
    TaxAccessedValue? taxAccessedValue;
    DateTime? saleDate;

    factory Housedata.fromJson(Map<String, dynamic> json) => Housedata(
        type: json["type"] == null ? null : json["type"],
        yearBuilt: json["year_built"] == null ? null : json["year_built"],
        bedrooms: json["bedrooms"] == null ? null : json["bedrooms"],
        bathrooms: json["bathrooms"] == null ? null : json["bathrooms"],
        structureType: json["structure_type"] == null ? null : json["structure_type"],
        lotSize: json["lot_size"] == null ? null : json["lot_size"],
        location: json["location"] == null ? null : json["location"],
        foundationType: json["foundation_type"] == null ? null : json["foundation_type"],
        taxAccessedValue: json["tax_accessed_value"] == null ? null : TaxAccessedValue.fromJson(json["tax_accessed_value"]),
        saleDate: json["sale_date"] == null ? null : DateTime.parse(json["sale_date"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "year_built": yearBuilt == null ? null : yearBuilt,
        "bedrooms": bedrooms == null ? null : bedrooms,
        "bathrooms": bathrooms == null ? null : bathrooms,
        "structure_type": structureType == null ? null : structureType,
        "lot_size": lotSize == null ? null : lotSize,
        "location": location == null ? null : location,
        "foundation_type": foundationType == null ? null : foundationType,
        "tax_accessed_value": taxAccessedValue == null ? null : taxAccessedValue!.toJson(),
        "sale_date": saleDate == null ? null : saleDate!.toIso8601String(),
    };
}

class TaxAccessedValue {
    TaxAccessedValue({
        this.the2021,
    });

    The2021? the2021;

    factory TaxAccessedValue.fromJson(Map<String, dynamic> json) => TaxAccessedValue(
        the2021: json["2021"] == null ? null : The2021.fromJson(json["2021"]),
    );

    Map<String, dynamic> toJson() => {
        "2021": the2021 == null ? null : the2021!.toJson(),
    };
}

class The2021 {
    The2021({
        this.value,
        this.land,
        this.improvements,
    });

    int? value;
    int? land;
    int? improvements;

    factory The2021.fromJson(Map<String, dynamic> json) => The2021(
        value: json["value"] == null ? null : json["value"],
        land: json["land"] == null ? null : json["land"],
        improvements: json["improvements"] == null ? null : json["improvements"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "land": land == null ? null : land,
        "improvements": improvements == null ? null : improvements,
    };
}

