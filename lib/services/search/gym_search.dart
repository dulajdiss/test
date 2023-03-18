import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/athlete_model.dart';
import 'package:ebbf/models/gyms_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<GymsModel>> fetchGymsSearch(String keyword,String location, String gender, String ltr) async {
  Map<String, String> map = {};
  List<GymsModel> responseOfGymsModel = [];
  map["keyword"]=keyword;
  map["location_id"]=location;
  map["gender_id"]=gender;
  map["ltr"]=ltr;
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.GYM_SEARCH,map);

  debugPrint('YooooKK GYM SEARCH KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfGymsModel = gymsModelFromJson(response.body);
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
