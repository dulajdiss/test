// To parse this JSON data, do
import 'dart:convert';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(
    json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(List<CourseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
  CourseModel({
    this.courseId,
    this.courseTitle,
    this.amount,
    this.enable,
    this.success,
  });

  String? courseId;
  String? courseTitle;
  String? amount;
  String? enable;
  int? success;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        courseId: json["course_id"] ?? "",
        courseTitle: json["course_title"] ?? "",
        amount: json["amount"] ?? "",
        enable: json["enable"] ?? "0",
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "course_title": courseTitle,
        "amount": amount,
        "enable": enable,
        "success": success,
      };
}

List<CourseLogic> courseLogicFromJson(String str) => json.decode(str) == null
    ? []
    : List<CourseLogic>.from(
        json.decode(str)!.map((x) => CourseLogic.fromJson(x)));

String courseLogicToJson(List<CourseLogic?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class CourseLogic {
  CourseLogic({
    this.num,
    this.success,
  });

  int? num;
  int? success;

  factory CourseLogic.fromJson(Map<String, dynamic> json) => CourseLogic(
        num: json["num"] ?? 0,
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "success": success,
      };
}
