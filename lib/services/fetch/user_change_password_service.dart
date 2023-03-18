import 'dart:developer';
import 'package:ebbf/configs/url.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<void> fetchChangePassword(
    String password,) async {
  Map<String, String> map = {};
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  map["password"] = password;
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.CHANGE_PASSWORD, map);
  print('YooooKK Change Password KKooooY =>');
  log(url.toString());
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {

  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
  }
}
