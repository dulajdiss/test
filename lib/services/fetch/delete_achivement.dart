import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/achievements_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<void> deleteAchievements(String acId) async {
  Map<String, String> map = {};
  map["ac_id"]=acId;
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.DELETEACHIVEMENTS, map);

  debugPrint('YooooKK Delete Achievements KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type":"application/json"},
  );

  if (response.statusCode == 200) {
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
  }
}
