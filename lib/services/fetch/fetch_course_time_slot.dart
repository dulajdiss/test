import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/course_time_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<CourseTimeModel>> fetchCourseTimeModelData(String ctId) async {
  Map<String, String> map = {};
  List<CourseTimeModel> responseOfCourseTimeSlot = [];
  map["course_id"] = ctId;
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.COACH_TIME_SLOTS_LIST, map);

  debugPrint('YooooKK Courses KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfCourseTimeSlot = courseTimeModelFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfCourseTimeSlot;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfCourseTimeSlot;
  }
}
