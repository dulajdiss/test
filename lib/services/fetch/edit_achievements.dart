import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/achievements_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<AchievementsModel>> fetchEditAchievements(
    String event, String acId, File imageFile) async {
  Map<String, String> map = {};

  List<AchievementsModel> responseOfAchievementModel = [];
  // now convert it into string
  String base64String = base64.encode(await imageFile.readAsBytes());
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  map["event"] = event;
  map["ac_id"] = acId;
  map["certificate"] = base64String;
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.EDITACHIVEMENTS, map);
  print('YooooKK Edit Achievements KKooooY =>');
  log(url.toString());
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfAchievementModel = achievementsFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfAchievementModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfAchievementModel;
  }
}
