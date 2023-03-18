import 'dart:convert';

List<OTPGenerator> otpGeneratorFromJson(String str) => List<OTPGenerator>.from(
    json.decode(str).map((x) => OTPGenerator.fromJson(x)));

String otpGeneratorToJson(List<OTPGenerator> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OTPGenerator {
  OTPGenerator({
    this.optRef,
    this.otp,
    this.rId,
    this.success,
  });

  String? optRef;
  String? otp;
  String? rId;
  int? success;

  factory OTPGenerator.fromJson(Map<String, dynamic> json) => OTPGenerator(
        optRef: json["opt_ref"],
        otp: json["otp"],
        rId: json["r_id"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "opt_ref": optRef,
        "otp": otp,
        "r_id": rId,
        "success": success,
      };
}

SignUpOTP signUpOTPFromJson(String str) => SignUpOTP.fromJson(json.decode(str));

String signUpOTPToJson(SignUpOTP data) => json.encode(data.toJson());

class SignUpOTP {
  SignUpOTP({
    this.otpId,
    this.success,
    this.message,
  });

  String? otpId;
  int? success;
  String? message;

  factory SignUpOTP.fromJson(Map<String, dynamic> json) => SignUpOTP(
        otpId: json["otp_id"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "otp_id": otpId,
        "success": success,
        "message": message,
      };
}

class OTPModel {
  OTPModel({this.success, this.message});

  int? success;
  String? message;

  factory OTPModel.fromJson(Map<String, dynamic> json) => OTPModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {"success": success, "message": message};
}
