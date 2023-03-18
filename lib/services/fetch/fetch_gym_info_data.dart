// import 'package:ebbf/configs/url.dart';
// import 'package:ebbf/models/gym_info_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
//
// Future<List<GymInfoModel>> fetchGymsInfoData(String id) async {
//   Map<String, String> map = {};
//   List<GymInfoModel> responseOfGymsInfoModel = [];
//   map['gym_id'] = id;
//   var url =
//       Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.GYM_INFO_URL, map);
//   debugPrint('YooooKK GymsInfo KKooooY => $url');
//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(
//     url,
//     headers: {"Content-Type": "application/json"},
//   );
//
//   if (response.statusCode == 200) {
//     responseOfGymsInfoModel = gymInfoModelFromJson(response.body);
//     print('Done ${response.body}');
//     if (kDebugMode) {
//       debugPrint('Done File:');
//     }
//     return responseOfGymsInfoModel;
//   } else {
//     if (kDebugMode) {
//       debugPrint('Fail File:');
//     }
//     print('Request failed with status: ${response.statusCode}.');
//     return responseOfGymsInfoModel;
//   }
// }
