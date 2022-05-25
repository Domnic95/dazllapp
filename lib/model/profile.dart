// To parse this JSON data, do
//
//     final featureIssue = featureIssueFromJson(jsonString);

import 'dart:convert';

Profile featureIssueFromJson(String str) => Profile.fromJson(json.decode(str));

String featureIssueToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.name,
    this.phone,
    this.email,
    this.website,
    this.address,
    this.references,
    this.description,
    this.businessLicence,
    this.projectPortfolio,
    this.yearsInBusiness,
    this.insuranceCertificate,
  });

  String? name;
  String? phone;
  String? email;
  String? website;
  String? address;
  String? references;
  String? description;
  String? businessLicence;
  List<dynamic>? projectPortfolio;
  int? yearsInBusiness;
  String? insuranceCertificate;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
        address: json["address"],
        references: json["references"],
        description: json["description"],
        businessLicence: json["business_licence"],
        projectPortfolio:
            List<dynamic>.from(json["project_portfolio"].map((x) => x)),
        yearsInBusiness: json["years_in_business"],
        insuranceCertificate: json["insurance_certificate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "website": website,
        "address": address,
        "references": references,
        "description": description,
        "business_licence": businessLicence,
        "project_portfolio": List<dynamic>.from(projectPortfolio!.map((x) => x)),
        "years_in_business": yearsInBusiness,
        "insurance_certificate": insuranceCertificate,
      };
}
