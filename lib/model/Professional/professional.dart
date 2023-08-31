// To parse this JSON data, do
//
//     final professionalData = professionalDataFromJson(jsonString);

import 'dart:convert';

ProfessionalData professionalDataFromJson(String str) => ProfessionalData.fromJson(json.decode(str));

String professionalDataToJson(ProfessionalData data) => json.encode(data.toJson());

class ProfessionalData {
    final String? name;
    final String? phone;
    final String? email;
    final String? website;
    final String? twitter;
    final String? facebook;
    final String? address;
    final String? references;
    final String? state;
    final String? city;
    final String? description;
    final String? businessLicence;
    final List<dynamic>? projectPortfolio;
    final int? yearsInBusiness;
    final String? insuranceCertificate;
    final String? insuranceContactNumber;
    final String? insuranceNumber;
    final String? images1;
    final String? images2;
    final String? images3;
    final String? images4;

    ProfessionalData({
        this.name,
        this.phone,
        this.email,
        this.website,
        this.twitter,
        this.facebook,
        this.address,
        this.references,
        this.state,
        this.city,
        this.description,
        this.businessLicence,
        this.projectPortfolio,
        this.yearsInBusiness,
        this.insuranceCertificate,
        this.insuranceContactNumber,
        this.insuranceNumber,
        this.images1,
        this.images2,
        this.images3,
        this.images4,
    });

    factory ProfessionalData.fromJson(Map<String, dynamic> json) => ProfessionalData(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
        twitter: json["twitter"],
        facebook: json["facebook"],
        address: json["address"],
        references: json["references"],
        state: json["state"],
        city: json["city"],
        description: json["description"],
        businessLicence: json["business_licence"],
        projectPortfolio: json["project_portfolio"] == null ? [] : List<dynamic>.from(json["project_portfolio"]!.map((x) => x)),
        yearsInBusiness: json["years_in_business"],
        insuranceCertificate: json["insurance_certificate"],
        insuranceContactNumber: json["insurance_contact_number"],
        insuranceNumber: json["insurance_number"],
        images1: json["images1"],
        images2: json["images2"],
        images3: json["images3"],
        images4: json["images4"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "website": website,
        "twitter": twitter,
        "facebook": facebook,
        "address": address,
        "references": references,
        "state": state,
        "city": city,
        "description": description,
        "business_licence": businessLicence,
        "project_portfolio": projectPortfolio == null ? [] : List<dynamic>.from(projectPortfolio!.map((x) => x)),
        "years_in_business": yearsInBusiness,
        "insurance_certificate": insuranceCertificate,
        "insurance_contact_number": insuranceContactNumber,
        "insurance_number": insuranceNumber,
        "images1": images1,
        "images2": images2,
        "images3": images3,
        "images4": images4,
    };
}
