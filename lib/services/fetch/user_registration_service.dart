import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/otp_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<SignUpOTP> userRegisterService(Map<String, String>map) async {
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.REGISTER_URL, map);

  debugPrint('YooooKK Register KKooooY => $url');
  SignUpOTP responseOfUserModel;
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfUserModel = signUpOTPFromJson(response.body);
    print('Register Done ${response.body}');
    return responseOfUserModel;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return SignUpOTP(message: "Failure", success: 0);
  }
}
