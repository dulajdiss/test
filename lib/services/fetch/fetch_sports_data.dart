import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<SportsModels>> fetchSportsData() async {
  Map<String, String> map = {};
  List<SportsModels> responseOfSportsModel = [];

  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.SPORTS_LIST_URL);

  debugPrint('YooooKK Sports KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfSportsModel = sportsFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfSportsModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfSportsModel;
  }
}
