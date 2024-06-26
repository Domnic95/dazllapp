// To parse this JSON data, do
//
//     final filterProject = filterProjectFromJson(jsonString);

import 'dart:convert';

List<FilterProject> filterProjectFromJson(String str) =>
    List<FilterProject>.from(
        json.decode(str).map((x) => FilterProject.fromJson(x)));

String filterProjectToJson(List<FilterProject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterProject {
  final String? email;
  final int? id;
  final String? location;
  final int? filterProjectFinal;

  FilterProject({
    this.email,
    this.id,
    this.location,
    this.filterProjectFinal,
  });

  factory FilterProject.fromJson(Map<String, dynamic> json) => FilterProject(
        email: json["email"],
        id: json["id"],
        location: json["location"],
        filterProjectFinal:
            json["final"] != null ? int.parse(json["final"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "location": location,
        "final": filterProjectFinal,
      };
}
