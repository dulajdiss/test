import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<UserModel> userLoginService(String userEmail, String password) async {
  Map<String, String> map = {};
  map['email'] = userEmail;
  map['password'] = password;
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.LOGIN_URL, map);

  debugPrint('YooooKK Login KKooooY => $url');
  UserModel responseOfUserModel;
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    print('Login Done ${response.body}');
    try {
      responseOfUserModel = userFromJson(response.body);
      return responseOfUserModel;
    } catch (e) {
      print("Exception $e coming");
      return UserModel(message: "Something went wrong.", success: 0);
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return UserModel(message: "Failure", success: 0);
  }
}
