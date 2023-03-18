// To parse this JSON data, do
//
import 'dart:convert';

List<MediaModel> mediaFromJson(String str) =>
    List<MediaModel>.from(json.decode(str).map((x) => MediaModel.fromJson(x)));

String mediaToJson(List<MediaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MediaModel {
  MediaModel({
    this.pic,
    this.success,
  });

  String? pic;
  int? success;

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        pic: json["pic"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "pic": pic,
        "success": success,
      };
}
