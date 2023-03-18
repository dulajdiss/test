import 'package:ebbf/configs/url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<void> eventRegistration(Map<String, String> map,) async {
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL,APIConstants.ATHLE_EVENT_REGISTER , map);

  debugPrint('YooooKK Register Event KKooooY => $url');
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
