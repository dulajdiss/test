import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/gym_activities_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<GymActivityModel>> fetchGymActivities() async {
  Map<String, String> map = {};
  List<GymActivityModel> responseOfGymsModel = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.GYM_ACTIVITIES, map);

  debugPrint('YooooKK Gym Activities KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfGymsModel = gymActivityModelFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfGymsModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfGymsModel;
  }
}
