// To parse this JSON data, do
//

import 'dart:convert';

List<AthleteModel> athleteFromJson(String str) => List<AthleteModel>.from(
    json.decode(str).map((x) => AthleteModel.fromJson(x)));

String athleteToJson(List<AthleteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AthleteModel {
  AthleteModel({
    this.title,
    this.pic,
    this.success,
  });

  String? title;
  String? pic;
  int? success;

  factory AthleteModel.fromJson(Map<String, dynamic> json) => AthleteModel(
        title: json["title"],
        pic: json["pic"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "pic": pic,
        "success": success,
      };
}

List<AthleteApplicationModel> athletAppicationFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<AthleteApplicationModel>.from(
            json.decode(str)!.map((x) => AthleteApplicationModel.fromJson(x)));
String welcomeToJson(List<AthleteApplicationModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class AthleteApplicationModel {
  AthleteApplicationModel({
    this.fullname,
    this.mobile,
    this.dob,
    this.email,
    this.eventName,
    this.success,
  });

  String? fullname;
  String? mobile;
  String? dob;
  String? email;
  String? eventName;
  int? success;

  factory AthleteApplicationModel.fromJson(Map<String, dynamic> json) =>
      AthleteApplicationModel(
        fullname: json["fullname"] ?? "",
        mobile: json["mobile"] ?? "",
        dob: json["dob"] ?? "",
        email: json["email"] ?? "",
        eventName: json["event_name"] ?? "",
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "mobile": mobile,
        "dob": dob,
        "email": email,
        "event_name": eventName,
        "success": success,
      };
}
