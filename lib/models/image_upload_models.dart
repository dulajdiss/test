import 'dart:convert';

List<MembershipImageUpload> membershipImageUploadFromJson(String str) =>
    List<MembershipImageUpload>.from(
        json.decode(str).map((x) => MembershipImageUpload.fromJson(x)));

String membershipImageUploadToJson(List<MembershipImageUpload> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MembershipImageUpload {
  MembershipImageUpload({
    this.fullName,
    this.lastName,
    this.email,
    this.mobile,
    this.originalFee,
    this.vat,
    this.fee,
    this.paymentUrl,
    this.success,
  });

  String? fullName;
  String? lastName;
  String? email;
  String? mobile;
  String? originalFee;
  String? vat;
  String? fee;
  String? paymentUrl;
  int? success;

  factory MembershipImageUpload.fromJson(Map<String, dynamic> json) =>
      MembershipImageUpload(
        fullName: json["fullname"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        mobile: json["mobile"] ?? "",
        originalFee: json["original_fee"] ?? "",
        vat: json["vat"] ?? "",
        fee: json["fee"] ?? "",
        paymentUrl: json["paymenturl"] ?? "",
        success: json["success"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "original_fee": originalFee,
        "vat": vat,
        "fee": fee,
        "paymenturl": paymentUrl,
        "success": success,
      };
}
