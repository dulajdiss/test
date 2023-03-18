// To parse this JSON data, do
import 'dart:convert';

List<GenderModel> genderFromJson(String str) => json.decode(str) == null ? [] : List<GenderModel>.from(json.decode(str)!.map((x) => GenderModel.fromJson(x)));

String genderToJson(List<GenderModel?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class GenderModel {
  GenderModel({
    this.genderId,
    this.genderTitle,
    this.success,
  });

  String? genderId;
  String? genderTitle;
  int? success;

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
    genderId: json["gender_id"],
    genderTitle: json["gender_title"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "gender_id": genderId,
    "gender_title": genderTitle,
    "success": success,
  };
}
