import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/course_type.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<CourseType>> fetchCourseType() async {
  Map<String, String> map = {};
  List<CourseType> responseOfCourseType = [];

  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.COURSE_TYPE);

  debugPrint('YooooKK Course Type KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );


  if (response.statusCode == 200) {
    responseOfCourseType = courseTypeFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfCourseType;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfCourseType;
  }
}
