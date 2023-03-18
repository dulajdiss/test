// To parse this JSON data, do
import 'dart:convert';

List<LicenseTypeModule> licenseTypeModuleFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<LicenseTypeModule>.from(
            json.decode(str)!.map((x) => LicenseTypeModule.fromJson(x)));

String licenseTypeModuleToJson(List<LicenseTypeModule?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class LicenseTypeModule {
  LicenseTypeModule({
    this.lId,
    this.title,
    this.amount,
    this.success,
  });

  String? lId;
  String? title;
  String? amount;
  int? success;

  factory LicenseTypeModule.fromJson(Map<String, dynamic> json) =>
      LicenseTypeModule(
        lId: json["l_id"],
        title: json["title"],
        amount: json["amount"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "l_id": lId,
        "title": title,
        "amount": amount,
        "success": success,
      };
}
