import 'dart:convert';

List<SponsorsModels> sponsorsFromJson(String str) => List<SponsorsModels>.from(json.decode(str).map((x) => SponsorsModels.fromJson(x)));

String sponsorsToJson(List<SponsorsModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SponsorsModels {
  SponsorsModels({
    this.title,
    this.description,
    this.pic,
    this.success,
  });

  String? title;
  String? description;
  String? pic;
  int? success;

  factory SponsorsModels.fromJson(Map<String, dynamic> json) => SponsorsModels(
    title: json["title"],
    description: json["description"],
    pic: json["pic"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "pic": pic,
    "success": success,
  };
}
