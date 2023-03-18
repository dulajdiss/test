import 'dart:convert';

List<SportsModels> sportsFromJson(String str) => List<SportsModels>.from(
    json.decode(str).map((x) => SportsModels.fromJson(x)));

String sportsToJson(List<SportsModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SportsModels {
  SportsModels({
    this.title,
    this.description,
    this.pic,
    this.sId,
    this.success,
  });

  String? title;
  String? description;
  String? pic;
  String? sId;
  int? success;

  factory SportsModels.fromJson(Map<String, dynamic> json) => SportsModels(
        title: json["title"],
        description: json["description"],
        pic: json["pic"],
        sId: json["s_id"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "pic": pic,
        "s_id": sId,
        "success": success,
      };
}
