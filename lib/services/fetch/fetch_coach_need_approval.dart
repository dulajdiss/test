import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/coach_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<CoachModel>> fetchCoachNeedApproval() async {
  Map<String, String> map = {};
  List<CoachModel> responseOfCoachModel = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url = Uri.http(
      APIConstants.MAIN_BASE_URL, APIConstants.COACH_APPROVAL_GYM, map);

  debugPrint('YooooKK Coach Approval KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfCoachModel = coachFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfCoachModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfCoachModel;
  }
}
