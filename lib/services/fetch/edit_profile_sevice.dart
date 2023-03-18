import 'dart:convert';
import 'package:ebbf/configs/url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> editProfileService(Map<String, String> map) async {
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.EDIT_PROFILE, map);

  debugPrint('YooooKK Edit Profile KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );
  String succes = "0";
  if (response.statusCode == 200) {
    print('Edit Profile Done ${response.body}');
    succes = json.decode(response.body)[0]["success"].toString();
    return succes;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return succes;
  }
}
