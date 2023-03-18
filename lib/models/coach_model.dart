// To parse this JSON data, do
//

import 'dart:convert';

List<CoachModel> coachFromJson(String str) => List<CoachModel>.from(json.decode(str).map((x) => CoachModel.fromJson(x)));

String coachToJson(List<CoachModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoachModel {
  CoachModel({
    this.title,
    this.pic,
    this.fullname,
    this.lastName,
    this.mobile,
    this.photo,
    this.status,
    this.idFront,
    this.idBack,
    this.msId,
    this.success,
  });

  String? title;
  String? pic;
  String? fullname;
  String? lastName;
  String? mobile;
  String? photo;
  String? status;
  String? idFront;
  String? idBack;
  String? msId;
  int? success;

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
    title: json["title"],
    pic: json["pic"],
    fullname: json["fullname"],
    lastName: json["last_name"],
    mobile: json["mobile"],
    photo: json["photo"],
    status: json["status"],
    idFront: json["id_front"],
    idBack: json["id_back"],
    msId: json["ms_id"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "pic": pic,
    "fullname": fullname,
    "last_name": lastName,
    "mobile": mobile,
    "photo": photo,
    "status": status,
    "id_front": idFront,
    "id_back": idBack,
    "ms_id": msId,
    "success": success,
  };
}
