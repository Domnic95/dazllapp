// To parse this JSON data, do
//
//     final realtorUser = realtorUserFromJson(jsonString);

import 'dart:convert';

RealtorUser realtorUserFromJson(String str) => RealtorUser.fromJson(json.decode(str));

String realtorUserToJson(RealtorUser data) => json.encode(data.toJson());

class RealtorUser {
    final String? firstName;
    final String? lastName;
    final String? phoneNumber;
    final String? realStateAgencyName;
    final String? cityOfRealStateAgency;
    final String? state;
    final int? zipCode;
    final String? email;

    RealtorUser({
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.realStateAgencyName,
        this.cityOfRealStateAgency,
        this.state,
        this.zipCode,
        this.email,
    });

    factory RealtorUser.fromJson(Map<String, dynamic> json) => RealtorUser(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        realStateAgencyName: json["real_state_agency_name"],
        cityOfRealStateAgency: json["city_of_real_state_agency"],
        state: json["state"],
        zipCode: json["zip_code"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "real_state_agency_name": realStateAgencyName,
        "city_of_real_state_agency": cityOfRealStateAgency,
        "state": state,
        "zip_code": zipCode,
        "email": email,
    };
}
