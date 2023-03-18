// To parse this JSON data, do
import 'dart:convert';

List<SportAssociate> sportAssociateFromJson(String str) =>
    List<SportAssociate>.from(
        json.decode(str).map((x) => SportAssociate.fromJson(x)));

String sportAssociateToJson(List<SportAssociate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SportAssociate {
  SportAssociate({
    this.title,
    this.saId,
    this.success,
  });

  String? title;
  String? saId;
  int? success;

  factory SportAssociate.fromJson(Map<String, dynamic> json) => SportAssociate(
        title: json["title"],
        saId: json["sa_id"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "sa_id": saId,
        "success": success,
      };
}
