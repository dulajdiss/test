import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/news_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<NewsModel>> fetchNewsData() async {
  Map<String, String> map = {};
  if (kDebugMode) {
    debugPrint('inside File:');
  }
  List<NewsModel> responseOfNewsModel = [];

  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.NEWS_LIST_URL);

  debugPrint('YooooKK News KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );


  if (response.statusCode == 200) {
    print('Done ${response.body}');
    responseOfNewsModel = newsModelFromJson(response.body);
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfNewsModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfNewsModel;
  }
}
