import 'dart:convert';

import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/course_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<CourseModel>> fetchCourseData(String ctId) async {
  Map<String, String> map = {};
  Map<String, String> mapLogic = {};
  List<CourseModel> responseOfCourse = [];
  List<CourseLogic> courseLogic = [];

  mapLogic["user_id"] = await read(SharedPreferencesConstant.userId);
  mapLogic["course_type_id"] = ctId;
  map["ct_id"] = ctId;

  //Logic Receiver
  debugPrint(
      'YooooKK Courses KKooooY => ${Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.COURSE_DISPLAY_LOGIC, mapLogic)}');
  // Await the http get response, then decode the json-formatted response.
  var responseLogic = await http.get(
    Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.COURSE_DISPLAY_LOGIC,
        mapLogic),
    headers: {"Content-Type": "application/json"},
  );
  if (responseLogic.statusCode == 200) {
    print('Done=> ${responseLogic.body}');
    courseLogic = courseLogicFromJson(responseLogic.body);
  }
  //Course List
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.COACH_COURSE_LIST, map);

  debugPrint('YooooKK Courses KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    List<CourseModel> tmpCourse = courseModelFromJson(response.body);
    responseOfCourse = [];
    for (int i = 0; i < tmpCourse.length; i++) {
      if (courseLogic[0].num == i + 1) {
        CourseModel tp = tmpCourse[i];
        tp.enable = "1";
        responseOfCourse.add(tp);
      } else {
        responseOfCourse.add(tmpCourse[i]);
      }
    }
    print('Done=> ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfCourse;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfCourse;
  }
}
