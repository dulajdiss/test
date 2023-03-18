// To parse this JSON data, do
//

import 'dart:convert';

List<EventsModel> eventsFromJson(String str) => List<EventsModel>.from(
    json.decode(str).map((x) => EventsModel.fromJson(x)));

String eventsToJson(List<EventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  EventsModel({
    this.eventId,
    this.eventName,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.amount,
    this.status,
    this.pic,
    this.eId,
    this.location,
    this.success,
  });

  String? eventId;
  String? title;
  String? eventName;
  String? description;
  String? startDate;
  String? endDate;
  String? amount;
  String? status;
  String? pic;
  String? eId;
  String? location;
  int? success;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        eventId: json["event_id"] ?? "",
        eventName: json["event_name"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        startDate: json["start_date"] ?? "",
        endDate: json["end_date"] ?? "",
        amount: json["amount"] ?? "",
        status: json["status"] ?? "",
        pic: json["pic"] ?? "",
        eId: json["e_id"] ?? "",
        location: json["location"] ?? "DUBAI, UAE",
        success: json["success"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "event_name": eventName,
        "title": title,
        "description": description,
        "start_date": startDate,
        "end_date": endDate,
        "amount": amount,
        "status": status,
        "pic": pic,
        "location": location,
        "e_id": eId,
        "success": success,
      };
}

List<EventFee> EventsFeeFromJson(String str) => json.decode(str) == null
    ? []
    : List<EventFee>.from(json.decode(str)!.map((x) => EventFee.fromJson(x)));

String EventsFeeToJson(List<EventFee?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class EventFee {
  EventFee({
    this.fee,
    this.success,
  });

  String? fee;
  int? success;

  factory EventFee.fromJson(Map<String, dynamic> json) => EventFee(
        fee: json["fee"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "fee": fee,
        "success": success,
      };
}
