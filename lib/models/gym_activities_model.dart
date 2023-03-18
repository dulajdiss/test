// To parse this JSON data, do

import 'dart:convert';

List<GymActivityModel> gymActivityModelFromJson(String str) =>
    List<GymActivityModel>.from(
        json.decode(str).map((x) => GymActivityModel.fromJson(x)));

String gymActivityModelToJson(List<GymActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GymActivityModel {
  GymActivityModel({
    this.activity,
    this.email,
    this.website,
    this.location,
    this.facebookP,
    this.instagramP,
    this.twitterP,
    this.linkedinP,
    this.youtubeP,
    this.introduction,
    this.specialities,
    this.pic,
    this.success,
  });

  String? activity;
  String? email;
  String? website;
  String? location;
  String? facebookP;
  String? instagramP;
  String? twitterP;
  String? linkedinP;
  String? youtubeP;
  String? introduction;
  String? specialities;
  String? pic;
  int? success;

  factory GymActivityModel.fromJson(Map<String, dynamic> json) =>
      GymActivityModel(
        activity: json["activity"],
        email: json["email"],
        website: json["website"],
        location: json["location"],
        facebookP: json["facebook_p"],
        instagramP: json["instagram_p"],
        twitterP: json["twitter_p"],
        linkedinP: json["linkedin_p"],
        youtubeP: json["youtube_p"],
        introduction: json["introduction"],
        specialities: json["specialities"],
        pic: json["pic"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "email": email,
        "website": website,
        "location": location,
        "facebook_p": facebookP,
        "instagram_p": instagramP,
        "twitter_p": twitterP,
        "linkedin_p": linkedinP,
        "youtube_p": youtubeP,
        "introduction": introduction,
        "specialities": specialities,
        "pic": pic,
        "success": success,
      };
}
