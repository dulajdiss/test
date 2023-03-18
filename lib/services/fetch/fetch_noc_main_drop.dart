import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/news_model.dart';
import 'package:ebbf/models/noc_module.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<NOCMainDropModule>> fetchNOCMainDrop() async {
  Map<String, String> map = {};
  if (kDebugMode) {
    debugPrint('inside File:');
  }
  List<NOCMainDropModule> responseOfNOCMAIN = [];

  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.NOC_MAIN_DROP);

  debugPrint('YooooKK NOC Main KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );


  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfNOCMAIN = nocMainDropModuleFromJson(response.body);
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfNOCMAIN;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfNOCMAIN;
  }
}
