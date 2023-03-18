import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/course_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<CourseModel>> fetchCourseDropList() async {
  Map<String, String> map = {};
  List<CourseModel> responseOfCourse = [];
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.COURSE_DROP_LIST, map);

  debugPrint('YooooKK COURSE DROP LIST KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfCourse = courseModelFromJson(response.body);
    print('Done ${response.body}');
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
