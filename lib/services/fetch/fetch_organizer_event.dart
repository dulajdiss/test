import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<EventsModel>> fetchOrganizerEventsData() async {
  Map<String, String> map = {};
  List<EventsModel> responseOfEventModel = [];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  var url = Uri.http(
      APIConstants.MAIN_BASE_URL, APIConstants.ORGANIZER_EVENT_LIST, map);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );
  debugPrint('YooooKK Organizer Events KKooooY => $url');
  if (response.statusCode == 200) {
    responseOfEventModel = eventsFromJson(response.body);
    print('Done ${response.body}');
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
