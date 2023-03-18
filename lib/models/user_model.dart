// To parse this JSON data, do
//

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.fullname,
    this.mobile,
    this.userType,
    this.email,
    this.success,
    this.message,
  });

  String? userId;
  String? fullname;
  String? mobile;
  String? userType;
  String? email;
  int? success;
  String? message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["user_id"],
    fullname: json["fullname"],
    mobile: json["mobile"],
    userType: json["user_type"],
    email: json["email"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fullname": fullname,
    "mobile": mobile,
    "user_type": userType,
    "email": email,
    "success": success,
    "message": message,
  };
}
