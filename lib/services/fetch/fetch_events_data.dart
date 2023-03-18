import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<EventsModel>> fetchEventsData() async {
  Map<String, String> map = {};
  List<EventsModel> responseOfEventModel = [];

  var url = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.EVENT_LIST_URL);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );
//Get Event REGISTER FEE
  var responseForFee = await http.get(
    Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.ATHLE_EVENT_FEE),
    headers: {"Content-Type": "application/json"},
  );
  debugPrint(
      'YooooKK Events FEE KKooooY => ${Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.ATHLE_EVENT_FEE)}');
  if (responseForFee.statusCode == 200) {
    print('Done ResponseForFee=> ${responseForFee.body}');
    List<EventFee> evfeelist = EventsFeeFromJson(responseForFee.body);
    if (evfeelist.isNotEmpty) {
      await save(SharedPreferencesConstant.eventFee, evfeelist[0].fee);
    } else {
      await save(SharedPreferencesConstant.eventFee, "0");
    }
  }

  debugPrint('YooooKK Events KKooooY => $url');
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
