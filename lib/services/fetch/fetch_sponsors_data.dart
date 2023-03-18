import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/sponsors_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<SponsorsModels>> fetchSponsorsData() async {
  Map<String, String> map = {};
  List<SponsorsModels> responseOfSponsorsModel = [];

  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.SPONSORS_LIST_URL);

  debugPrint('YooooKK Sponsors KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfSponsorsModel = sponsorsFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfSponsorsModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfSponsorsModel;
  }
}
