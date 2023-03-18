// To parse this JSON data, do
import 'dart:convert';

List<DashBoardDetails> dashBoardDetailsFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<DashBoardDetails>.from(
            json.decode(str)!.map((x) => DashBoardDetails.fromJson(x)));

String dashBoardDetailsToJson(List<DashBoardDetails?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class DashBoardDetails {
  DashBoardDetails(
      {this.userType,
      this.established,
      this.ownerName,
      this.location,
      this.workingHours,
      this.noofcoaches,
      this.contactNumber,
      this.gymlogo,
      this.membershipvalidatill,
      this.membershipstatus,
      this.coachlogo,
      this.qrcode,
      this.card,
      this.cardNo,
      this.coachTitle,
      this.expiryDate,
      this.cardBg,
      this.membership,
      this.athletelogo,
      this.id,
      this.athleteTitle,
      this.membershipValid,
      this.success,
      this.organizerDashboardDetailsList});

  String? userType;
  String? established;
  String? ownerName;
  String? location;
  String? workingHours;
  String? noofcoaches;
  String? contactNumber;
  String? gymlogo;
  String? membershipvalidatill;
  String? membershipstatus;
  String? coachlogo;
  String? qrcode;
  String? card;
  String? cardNo;
  String? coachTitle;
  String? expiryDate;
  String? cardBg;
  String? membership;
  String? athletelogo;
  String? id;
  String? athleteTitle;
  String? membershipValid;
  String? success;
  List<OrganizerDashboardDetails>? organizerDashboardDetailsList;

  factory DashBoardDetails.fromJson(Map<String, dynamic> json) =>
      DashBoardDetails(
        userType: json["user_type"].toString() ?? '0',
        established: json["established"].toString() ?? "",
        ownerName: json["owner_name"].toString() ?? "",
        location: json["location"].toString() ?? "",
        workingHours: json["working_hours"].toString() ?? "",
        noofcoaches: json["noofcoaches"].toString() ?? "",
        contactNumber: json["contact_number"].toString() ?? "",
        gymlogo: json["gymlogo"].toString() ?? "",
        membershipvalidatill: json["membershipvalidatill"].toString() ?? "",
        membershipstatus: json["membershipstatus"].toString() ?? "",
        coachlogo: json["coachlogo"].toString() ?? "",
        qrcode: json["qrcode"].toString() ?? "",
        card: json["card"].toString() ?? "",
        cardNo: json["card_no"].toString() ?? "",
        coachTitle: json["coach_title"].toString() ?? "",
        expiryDate: json["expiry_date"].toString() ?? "",
        cardBg: json["card_bg"].toString() ?? "",
        membership: json["membership"].toString() ?? "",
        athletelogo: json["athletelogo"].toString() ?? "",
        id: json["id"].toString() ?? "",
        athleteTitle: json["athlete_title"].toString() ?? "",
        membershipValid: json["membership_valid"].toString() ?? "",
        success: json["success"].toString() ?? '0',
        organizerDashboardDetailsList: json["OrganizerDashboardDetails"]??[],
      );

  Map<String, dynamic> toJson() => {
        "user_type": userType,
        "established": established,
        "owner_name": ownerName,
        "location": location,
        "working_hours": workingHours,
        "noofcoaches": noofcoaches,
        "contact_number": contactNumber,
        "gymlogo": gymlogo,
        "membershipvalidatill": membershipvalidatill,
        "membershipstatus": membershipstatus,
        "coachlogo": coachlogo,
        "qrcode": qrcode,
        "card": card,
        "card_no": cardNo,
        "coach_title": coachTitle,
        "expiry_date": expiryDate,
        "card_bg": cardBg,
        "membership": membership,
        "athletelogo": athletelogo,
        "id": id,
        "athlete_title": athleteTitle,
        "membership_valid": membershipValid,
        "success": success,
      };
}

List<ProfileDetailsModel> profileDetailsModelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<ProfileDetailsModel>.from(
            json.decode(str)!.map((x) => ProfileDetailsModel.fromJson(x)));

String profileDetailsModelToJson(List<ProfileDetailsModel>? data) =>
    json.encode(
        data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class ProfileDetailsModel {
  ProfileDetailsModel({
    this.userType,
    this.id,
    this.email,
    this.phone,
    this.workingHours,
    this.location,
    this.website,
    this.facebookP,
    this.twitterP,
    this.instagramP,
    this.linkedinP,
    this.youtubeP,
    this.introduction,
    this.success,
  });

  int? userType;
  String? id;
  String? email;
  String? phone;
  String? workingHours;
  String? location;
  String? website;
  String? facebookP;
  String? twitterP;
  String? instagramP;
  String? linkedinP;
  String? youtubeP;
  String? introduction;
  int? success;

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsModel(
        userType: json["user_type"] ?? 0,
        id: json["id"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        workingHours: json["working_hours"] ?? "",
        location: json["location"] ?? "",
        website: json["website"] ?? "",
        facebookP: json["facebook_p"] ?? "",
        twitterP: json["twitter_p"] ?? "",
        instagramP: json["instagram_p"] ?? "",
        linkedinP: json["linkedin_p"] ?? "",
        youtubeP: json["youtube_p"] ?? "",
        introduction: json["introduction"] ?? '',
        success: json["success"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "user_type": userType,
        "id": id,
        "email": email,
        "phone": phone,
        "working_hours": workingHours,
        "location": location,
        "website": website,
        "facebook_p": facebookP,
        "twitter_p": twitterP,
        "instagram_p": instagramP,
        "linkedin_p": linkedinP,
        "youtube_p": youtubeP,
        "success": success,
      };
}

List<OrganizerDashboardDetails> organizerDashboardDetailsFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<OrganizerDashboardDetails>.from(json
            .decode(str)!
            .map((x) => OrganizerDashboardDetails.fromJson(x)));

String organizerDashboardDetailsToJson(
        List<OrganizerDashboardDetails?>? data) =>
    json.encode(
        data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class OrganizerDashboardDetails {
  OrganizerDashboardDetails({
    this.logo,
    this.success,
  });

  String? logo;
  int? success;

  factory OrganizerDashboardDetails.fromJson(Map<String, dynamic> json) =>
      OrganizerDashboardDetails(
        logo: json["logo"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "success": success,
      };
}
