// To parse this JSON data, do
import 'dart:convert';

List<LocationModule> locationFromJson(String str) => json.decode(str) == null ? [] : List<LocationModule>.from(json.decode(str)!.map((x) => LocationModule.fromJson(x)));

String locationToJson(List<LocationModule?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class LocationModule {
  LocationModule({
    this.locationId,
    this.locationTitle,
    this.success,
  });

  String? locationId;
  String? locationTitle;
  int? success;

  factory LocationModule.fromJson(Map<String, dynamic> json) => LocationModule(
    locationId: json["location_id"]??"",
    locationTitle: json["location_title"]??"",
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "location_title": locationTitle,
    "success": success,
  };
}
