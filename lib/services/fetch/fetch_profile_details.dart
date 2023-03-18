import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/dashboard_details.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<ProfileDetailsModel> fetchProfileDetails() async {
  Map<String, String> map = {};
  List<ProfileDetailsModel> profileDetailsModel = [ProfileDetailsModel()];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  map["user_type"] = await read(SharedPreferencesConstant.userType);
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.PROFILE, map);

  debugPrint('YooooKK Profile Details KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode == 200) {
    print('Edit DashBoard Profile Details Done ${response.body}');
    profileDetailsModel = [];
    profileDetailsModel = profileDetailsModelFromJson(response.body);
    return profileDetailsModel[0];
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return profileDetailsModel[0];
  }
}
