import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    this.title,
    this.description,
    this.pic,
    this.createdDate,
    this.success,
  });

  String? title;
  String? description;
  String? pic;
  String? createdDate;
  int? success;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        title: json["title"],
        description: json["description"],
        pic: json["pic"],
        createdDate: json["created_date"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "pic": pic,
        "created_date": createdDate,
        "success": success,
      };
}
