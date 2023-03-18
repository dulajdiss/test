// To parse this JSON data, do
import 'dart:convert';

List<EServiceModel> eServiceModelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<EServiceModel>.from(
            json.decode(str)!.map((x) => EServiceModel.fromJson(x)));

String eServiceModelToJson(List<EServiceModel> data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class EServiceModel {
  EServiceModel({
    this.name,
    this.submenu,
    this.submenuSeo,
    this.tableHeading,
    this.description,
    this.requiredDocument,
    this.serviceFee,
    this.termsConditions,
    this.serviceProcedure,
    this.serviceDirectContact,
    this.success,
  });

  Name? name;
  String? submenu;
  String? submenuSeo;
  String? tableHeading;
  String? description;
  String? requiredDocument;
  String? serviceFee;
  String? termsConditions;
  String? serviceProcedure;
  String? serviceDirectContact;
  int? success;

  factory EServiceModel.fromJson(Map<String, dynamic> json) => EServiceModel(
        name: nameValues!.map[json["name"]],
        submenu: json["submenu"] ?? "N/A",
        submenuSeo: json["submenu_seo"] ?? "N/A",
        tableHeading: json["table_heading"] ?? "N/A",
        description: json["description"] ?? "N/A",
        requiredDocument: json["required_documents"] ?? "N/A",
        serviceFee: json["service_fee"] ?? "N/A",
        termsConditions: json["terms_conditions"] ?? "N/A",
        serviceProcedure: json["service_procedure"] ?? "N/A",
        serviceDirectContact: json["service_direct_contact"] ?? "N/A",
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "submenu": submenu,
        "submenu_seo": submenuSeo,
        "table_heading": tableHeading,
        "description": description,
        "required_documents": requiredDocument,
        "service_fee": serviceFee,
        "terms_conditions": termsConditions,
        "service_procedure": serviceProcedure,
        "service_direct_contact": serviceDirectContact,
        "success": success,
      };
}

enum Name { ATHLETE, COACH, GYM }

final nameValues =
    EnumValues({"ATHLETE": Name.ATHLETE, "COACH": Name.COACH, "GYM": Name.GYM});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
