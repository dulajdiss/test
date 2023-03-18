import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/location_module.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<LocationModule>> fetchLocation() async {
  Map<String, String> map = {};
  List<LocationModule> responseOfLocationModule = [];
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.LOACTION_LIST);

  debugPrint('YooooKK Location List KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfLocationModule = locationFromJson(response.body);
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfLocationModule;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfLocationModule;
  }
}
