import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/license_type_module.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<LicenseTypeModule>> fetchLicenseType() async {
  Map<String, String> map = {};
  List<LicenseTypeModule> responseOfLicenseTypeModule = [];
  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.LICENSE_TYPES);

  debugPrint('YooooKK LicenseType KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );


  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfLicenseTypeModule = licenseTypeModuleFromJson(response.body);
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfLicenseTypeModule;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfLicenseTypeModule;
  }
}
