import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/gender_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<GenderModel>> fetchGender() async {
  Map<String, String> map = {};
  List<GenderModel> responseOfGenderList = [];
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.GENDER_LIST);

  debugPrint('YooooKK Gender List KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfGenderList = genderFromJson(response.body);
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfGenderList;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfGenderList;
  }
}
