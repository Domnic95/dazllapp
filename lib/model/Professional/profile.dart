// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

ProfileData profileDataFromJson(String str) => ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
    String? name;
    String? phone;
    String? email;
    String? website;
    dynamic twitter;
    String? facebook;
    String? address;
    dynamic references;
    String? state;
    String? city;
    String? description;
    String? businessLicence;
    List<dynamic>? projectPortfolio;
    int? yearsInBusiness;
    String? insuranceCertificate;
    String? insuranceContactNumber;
    String? insuranceNumber;
    dynamic images1;
    dynamic images2;
    dynamic images3;
    dynamic images4;

    ProfileData({
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

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
        projectPortfolio: json["project_portfolio"] != null
    ? List<dynamic>.from(json["project_portfolio"].map((x) => x))
    : [],
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
        "project_portfolio": List<dynamic>.from(projectPortfolio!.map((x) => x)),
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
