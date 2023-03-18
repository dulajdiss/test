import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/sport_associated.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<SportAssociate>> fetchSportsAssociated() async {
  Map<String, String> map = {};
  List<SportAssociate> responseOfAchievementModel = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.SPORTASSOCIATED, map);
  print('YooooKK Sport Associated KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfAchievementModel = sportAssociateFromJson(response.body);
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
