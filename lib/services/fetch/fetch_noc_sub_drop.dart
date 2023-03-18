import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/noc_module.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<NOCSubDropModule>> fetchNOCSubDrop() async {
  Map<String, String> map = {};
  if (kDebugMode) {
    debugPrint('inside File:');
  }
  List<NOCSubDropModule> responseOfNOCSub = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.NOC_SUB_DROP,map);

  debugPrint('YooooKK NOC Sub KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );


  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfNOCSub = nocSubDropModuleFromJson(response.body);
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfNOCSub;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfNOCSub;
  }
}
