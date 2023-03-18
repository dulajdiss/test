import 'dart:io';
import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/achievements_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<List<AchievementsModel>> fetchAddAchievements(
    String event, File imagePath) async {
  List<AchievementsModel> responseOfAchievementModel = [];
  var uri = Uri.http(APIConstants.MAIN_BASE_URL, APIConstants.ADDACHIVEMENTS);
  var request = http.MultipartRequest('POST', uri)
    ..fields['user_id'] = await read(SharedPreferencesConstant.userId)
    ..fields['event'] = event
    ..files.add(await http.MultipartFile.fromPath(
        'certificate', imagePath.path.toString(),
        contentType: MediaType('image', 'png')));
  print('YooooKK Add Achievements KKooooY =>$uri ');
  for (int i = 0; i < request.files.length; i++) {
    print(request.files[i].filename);
  }
  var response = await request.send();
  if (response.statusCode == 200) {
    print('Add Achievements Uploaded=> ${request.fields}');
  }
  return responseOfAchievementModel;
}
