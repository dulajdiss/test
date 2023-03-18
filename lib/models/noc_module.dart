// To parse this JSON data, do
import 'dart:convert';

List<NOCMainDropModule> nocMainDropModuleFromJson(String str) => json.decode(str) == null ? [] : List<NOCMainDropModule>.from(json.decode(str)!.map((x) => NOCMainDropModule.fromJson(x)));

String nocMainDropModuleToJson(List<NOCMainDropModule?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class NOCMainDropModule {
  NOCMainDropModule({
    this.lId,
    this.title,
    this.amount,
    this.success,
  });

  String? lId;
  String? title;
  String? amount;
  int? success;

  factory NOCMainDropModule.fromJson(Map<String, dynamic> json) => NOCMainDropModule(
    lId: json["l_id"]??"",
    title: json["title"]??"",
    amount: json["amount"]??"",
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "l_id": lId,
    "title": title,
    "amount": amount,
    "success": success,
  };
}


List<NOCListModule> nocListModuleFromJson(String str) => json.decode(str) == null ? [] : List<NOCListModule>.from(json.decode(str)!.map((x) => NOCListModule.fromJson(x)));
String nocListModuleToJson(List<NOCListModule?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class NOCListModule {
  NOCListModule({
    this.fileName,
    this.coach,
    this.issueDate,
    this.success,
  });

  String? fileName;
  String? coach;
  String? issueDate;
  int? success;

  factory NOCListModule.fromJson(Map<String, dynamic> json) => NOCListModule(
    fileName: json["file_name"]??"",
    coach: json["coach"]??"",
    issueDate: json["issue_date"]??"",
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "file_name": fileName,
    "coach": coach,
    "issue_date": issueDate,
    "success": success,
  };
}


List<NOCSubDropModule> nocSubDropModuleFromJson(String str) => json.decode(str) == null ? [] : List<NOCSubDropModule>.from(json.decode(str)!.map((x) => NOCSubDropModule.fromJson(x)));

String nocSubDropModuleToJson(List<NOCSubDropModule?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class NOCSubDropModule {
  NOCSubDropModule({
    this.lId,
    this.coach,
    this.amount,
    this.success,
  });

  String? lId;
  String? coach;
  String? amount;
  int? success;

  factory NOCSubDropModule.fromJson(Map<String, dynamic> json) => NOCSubDropModule(
    lId: json["l_id"]??"",
    coach: json["coach"]??"",
    amount: json["amount"]??"",
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "l_id": lId,
    "coach": coach,
    "amount": amount,
    "success": success,
  };
}