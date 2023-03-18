import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/achievements_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<AchievementsModel>> fetchAchievements() async {
  Map<String, String> map = {};
  List<AchievementsModel> responseOfAchievementModel = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.ACHIVEMENTS, map);

  debugPrint('YooooKK Achievements KKooooY => $url');
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
    return responseOfAchievementModel[0].success == 0
        ? []
        : responseOfAchievementModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfAchievementModel;
  }
}
