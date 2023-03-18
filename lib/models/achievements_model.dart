// To parse this JSON data, do
//

import 'dart:convert';

List<AchievementsModel> achievementsFromJson(String str) => List<AchievementsModel>.from(json.decode(str).map((x) => AchievementsModel.fromJson(x)));

String achievementsToJson(List<AchievementsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AchievementsModel {
  AchievementsModel({
    this.title,
    this.startDate,
    this.endDate,
    this.location,
    this.status,
    this.certificate,
    this.acId,
    this.success,
  });

  String? title;
  String? startDate;
  String? endDate;
  String? location;
  String? status;
  String? certificate;
  String? acId;
  int? success;

  factory AchievementsModel.fromJson(Map<String, dynamic> json) => AchievementsModel(
    title: json["title"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    location: json["location"],
    status: json["status"],
    certificate: json["certificate"],
    acId: json["ac_id"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "start_date":startDate,
    "end_date": endDate,
    "location": location,
    "status": status,
    "certificate": certificate,
    "ac_id": acId,
    "success": success,
  };
}
