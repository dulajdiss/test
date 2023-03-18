// To parse this JSON data, do
import 'dart:convert';

List<CourseTimeModel> courseTimeModelFromJson(String str) => List<CourseTimeModel>.from(json.decode(str).map((x) => CourseTimeModel.fromJson(x)));

String courseTimeModelToJson(List<CourseTimeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseTimeModel {
  CourseTimeModel({
    this.courseId,
    this.courseTitle,
    this.description,
    this.amount,
    this.courseslots,
    this.success,
  });

  String? courseId;
  String? courseTitle;
  String? description;
  String? amount;
  List<CoursesSlot>? courseslots;
  int? success;

  factory CourseTimeModel.fromJson(Map<String, dynamic> json) => CourseTimeModel(
    courseId: json["course_id"],
    courseTitle: json["course_title"],
    description: json["description"],
    amount: json["amount"],
    courseslots: List<CoursesSlot>.from(json["courseslots"].map((x) => CoursesSlot.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "course_title": courseTitle,
    "description": description,
    "amount": amount,
    "success": success,
  };
}

class CoursesSlot {
  CoursesSlot({
    this.capacity,
    this.slotsLeft,
    this.slotDate,
  });

  String? capacity;
  int? slotsLeft;
  String? slotDate;

  factory CoursesSlot.fromJson(Map<String, dynamic> json) => CoursesSlot(
    capacity: json["capacity"],
    slotsLeft: json["slots_left"],
    slotDate: json["slot_date"],
  );

  Map<String, dynamic> toJson() => {
    "capacity": capacity,
    "slots_left": slotsLeft,
    "slot_date": slotDate,
  };
}
