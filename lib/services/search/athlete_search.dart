import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/athlete_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<AthleteModel>> fetchAthleteSearch(String location, String gender, String sport) async {
  Map<String, String> map = {};
  List<AthleteModel> responseOfAthleteModel = [];
  map["location"]=location;
  map["gender"]=gender;
  map["sport"]=sport;
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.ATHLET_SEARCH,map);

  debugPrint('YooooKK Athlete SEARCH KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfAthleteModel = athleteFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfAthleteModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfAthleteModel;
  }
}
