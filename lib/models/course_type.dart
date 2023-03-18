// To parse this JSON data, do

import 'dart:convert';

List<CourseType> courseTypeFromJson(String str) => List<CourseType>.from(json.decode(str).map((x) => CourseType.fromJson(x)));

String courseTypeToJson(List<CourseType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseType {
  CourseType({
    this.ctId,
    this.ctTitle,
    this.success,
  });

  String? ctId;
  String? ctTitle;
  int? success;

  factory CourseType.fromJson(Map<String, dynamic> json) => CourseType(
    ctId: json["ct_id"],
    ctTitle: json["ct_title"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "ct_id": ctId,
    "ct_title": ctTitle,
    "success": success,
  };
}
