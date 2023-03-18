import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<EventsModel>> fetchEventsSearch(
    String location, String event, String sport) async {
  Map<String, String> map = {};
  map["location_id"] = location;
  map["event_id"] = event;
  map["sport_id"] = sport;
  List<EventsModel> responseOfEventModel = [];
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.EVENT_SEARCH, map);
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );
  if (kDebugMode) {
    print('YooooKK Events Search KKooooY => $url');
  }
  if (response.statusCode == 200) {
    responseOfEventModel = eventsFromJson(response.body);
    if (kDebugMode) {
      print('Done ${response.body}');
    }
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responseOfEventModel;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responseOfEventModel;
  }
}
