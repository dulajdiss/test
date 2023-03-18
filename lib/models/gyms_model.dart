import 'dart:convert';

List<GymsModel> gymsModelFromJson(String str) =>
    List<GymsModel>.from(json.decode(str).map((x) => GymsModel.fromJson(x)));

String gymsModelToJson(List<GymsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GymsModel {
  GymsModel({
    this.gymId,
    this.title,
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
  String? gymId;
  String? title;
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

  factory GymsModel.fromJson(Map<String, dynamic> json) => GymsModel(
        gymId: json["gym_id"]??"",
        title: json["title"]??"",
        email: json["email"]??"",
        website: json["website"]??"",
        location: json["location"]??"",
        facebookP: json["facebook_p"]??"",
        instagramP: json["instagram_p"]??"",
        twitterP: json["twitter_p"]??"",
        linkedinP: json["linkedin_p"]??"",
        youtubeP: json["youtube_p"]??"",
        introduction: json["introduction"]??"",
        specialities: json["specialities"]??"",
        pic: json["pic"]??"",
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "gym_id": gymId,
        "title": title,
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
