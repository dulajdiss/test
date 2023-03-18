import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/eservices_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<EServiceModel>> fetchEServices() async {
  Map<String, String> map = {};
  List<EServiceModel> responseOfEServices = [];
  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.ESERVICE, map);

  debugPrint('YooooKK E SERVICE LIST KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    responseOfEServices = eServiceModelFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfEServices;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfEServices;
  }
}
