import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void uploadRenewLicense(File imagePath) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var user = await localStorage.getString('user_id');
  var request =  http.MultipartRequest(
      "POST", Uri.parse('http://www.eis-digital.com/schoolsoftware/mobileapp/teacherhomeworkadd'));
  request.fields['user_id'] = user!;
  request.fields['school_id'] = '1';
  request.files.add(await http.MultipartFile.fromPath('renew_license', imagePath.path));

  request.send().then((response) {
    http.Response.fromStream(response).then((onValue) {
      try {
        print(onValue.body);
      } catch (e) {
        print(e);
      }
    });
  });
}