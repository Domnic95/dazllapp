// To parse this JSON data, do
//
//     final professionalData = professionalDataFromJson(jsonString);

import 'dart:convert';

ProfessionalData professionalDataFromJson(String str) =>
    ProfessionalData.fromJson(json.decode(str));

String professionalDataToJson(ProfessionalData data) =>
    json.encode(data.toJson());

class ProfessionalData {
  ProfessionalData({
    this.name,
    this.phone,
    this.email,
    this.website,
    this.twitter,
    this.facebook,
    this.address,
    this.references,
    this.description,
    this.businessLicence,
    this.projectPortfolio,
    this.yearsInBusiness,
    this.insuranceCertificate,
    this.insuranceContactPerson,
    this.contactIns,
    this.images1,
    this.images2,
    this.images3,
    this.images4,
  });

  String? name;
  String? phone;
  String? email;
  String? website;
  String? twitter;
  String? facebook;
  String? address;
  String? references;
  String? description;
  String? businessLicence;
  List<dynamic>? projectPortfolio;
  int? yearsInBusiness;
  String? insuranceCertificate;
  String? insuranceContactPerson;
  String? contactIns;
  String? images1;
  String? images2;
  String? images3;
  String? images4;

  factory ProfessionalData.fromJson(Map<String, dynamic> json) =>
      ProfessionalData(
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        website: json["website"] == null ? null : json["website"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        address: json["address"] == null ? null : json["address"],
        references: json["references"] == null ? null : json["references"],
        description: json["description"] == null ? null : json["description"],
        businessLicence:
            json["business_licence"] == null ? null : json["business_licence"],
        projectPortfolio: json["project_portfolio"] == null
            ? null
            : List<dynamic>.from(json["project_portfolio"].map((x) => x)),
        yearsInBusiness: json["years_in_business"] == null
            ? null
            : json["years_in_business"],
        insuranceCertificate: json["insurance_certificate"] == null
            ? null
            : json["insurance_certificate"],
        insuranceContactPerson: json["insurance_contact_number"] == null
            ? null
            : json["insurance_contact_number"],
        contactIns:
            json["insurance_number"] == null ? null : json["insurance_number"],
        images1: json["images1"] == null ? null : json["images1"],
        images2: json["images2"] == null ? null : json["images2"],
        images3: json["images3"] == null ? null : json["images3"],
        images4: json["images4"] == null ? null : json["images4"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "website": website == null ? null : website,
        "twitter": twitter == null ? null : twitter,
        "facebook": facebook == null ? null : facebook,
        "address": address == null ? null : address,
        "references": references == null ? null : references,
        "description": description == null ? null : description,
        "business_licence": businessLicence == null ? null : businessLicence,
        "project_portfolio": projectPortfolio == null
            ? null
            : List<dynamic>.from(projectPortfolio!.map((x) => x)),
        "years_in_business": yearsInBusiness == null ? null : yearsInBusiness,
        "insurance_certificate":
            insuranceCertificate == null ? null : insuranceCertificate,
        "insurance_contact_number":
            insuranceContactPerson == null ? null : insuranceContactPerson,
        "insurance_number": contactIns == null ? null : contactIns,
        "images1": images1 == null ? null : images1,
        "images2": images2 == null ? null : images2,
        "images3": images3 == null ? null : images3,
        "images4": images4 == null ? null : images4,
      };
}
