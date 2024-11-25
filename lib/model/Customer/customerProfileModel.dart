// To parse this JSON data, do
//
//     final customerProfile = customerProfileFromJson(jsonString);

import 'dart:convert';

CustomerProfile customerProfileFromJson(String str) => CustomerProfile.fromJson(json.decode(str));

String customerProfileToJson(CustomerProfile data) => json.encode(data.toJson());

class CustomerProfile {
    Customer? customer;
    int? status;

    CustomerProfile({
        this.customer,
        this.status,
    });

    factory CustomerProfile.fromJson(Map<String, dynamic> json) => CustomerProfile(
        customer: Customer.fromJson(json["customer"] == null? {}: json["customer"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "customer": customer!.toJson(),
        "status": status,
    };
}

class Customer {
    int? id;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    int? zipCode;
    String? email;
    String? createdAt;
    String? updatedAt;

    Customer({
        this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.zipCode,
        this.email,
        this.createdAt,
        this.updatedAt,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        zipCode: json["zip_code"],
        email: json["email"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "zip_code": zipCode,
        "email": email,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
