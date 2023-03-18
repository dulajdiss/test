import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/dashboard_details.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<DashBoardDetails> fetchDashBoardDetails() async {
  Map<String, String> map = {};
  List<DashBoardDetails> dashBoardDetails = [DashBoardDetails()];
  map["user_id"] = await read(SharedPreferencesConstant.userId);
  map["user_type"] = await read(SharedPreferencesConstant.userType);
  var url =
      Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.DASHBOARD_DETAILS, map);

  debugPrint('YooooKK DashBoard Details KKooooY => $url');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode == 200) {
    print('Edit DashBoard Details Done ${response.body}');
    dashBoardDetails = [];
    if (UserType.UserType_Organized ==
        await read(SharedPreferencesConstant.userType)) {
      List<OrganizerDashboardDetails> temODD =
          organizerDashboardDetailsFromJson(response.body);
      DashBoardDetails tdbd = DashBoardDetails(
          userType: await read(SharedPreferencesConstant.userType),
          organizerDashboardDetailsList: temODD);
      dashBoardDetails.add(tdbd);
    } else {
      dashBoardDetails = dashBoardDetailsFromJson(response.body);
    }
    return dashBoardDetails[0];
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return dashBoardDetails[0];
  }
}
