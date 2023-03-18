import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/media_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<MediaModel>> fetchMediaData() async {
  Map<String, String> map = {};
  List<MediaModel> responseOfMediaModel = [];

  var url =
  Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.MEDIA_URL);

  debugPrint('YooooKK Media KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );


  if (response.statusCode == 200) {
    responseOfMediaModel = mediaFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfMediaModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfMediaModel;
  }
}
