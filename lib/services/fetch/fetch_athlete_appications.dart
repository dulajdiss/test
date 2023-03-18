import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/athlete_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<AthleteApplicationModel>> fetchAthleteApplication() async {
  Map<String, String> map = {};
  List<AthleteApplicationModel> responseOfAthleteAppicationModel = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.ATHLETE_APPLICATION,map);

  debugPrint('YooooKK Athlete Appication KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfAthleteAppicationModel = athletAppicationFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfAthleteAppicationModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfAthleteAppicationModel;
  }
}
