import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/gyms_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<GymsModel>> fetchGymsData() async {
  Map<String, String> map = {};
  List<GymsModel> responseOfGymsModel = [];

  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.GYM_LIST_URL);
  debugPrint('YooooKK Gyms KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfGymsModel = gymsModelFromJson(response.body);
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
