import 'package:ebbf/configs/url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> otpVerify(String otpNumber, String otpUrl) async {
  Map<String, String> map = {};
  map['o_id'] = otpNumber.toString();
  var url = Uri.http(APIConstants.MAIN_BASE_URL, otpUrl, map);

  debugPrint('YooooKK OTP Verify KKooooY => $url');
  String message = 'Error';
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    message = response.body;
    print('OTP Done ${response.body}');
    return message;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return message;
  }
}
