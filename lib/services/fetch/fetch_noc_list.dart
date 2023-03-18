import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/noc_module.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<NOCListModule>> fetchNOCList() async {
  Map<String, String> map = {};
  if (kDebugMode) {
    debugPrint('inside File:');
  }
  List<NOCListModule> responseOfNOCList = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.NOC_LIST,map);

  debugPrint('YooooKK NOC List KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );


  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfNOCList = nocListModuleFromJson(response.body);
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfNOCList;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfNOCList;
  }
}
