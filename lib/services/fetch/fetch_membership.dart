import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<String> imageUploadingAPICall(MultipartRequest request) async {
  print("Image Uploading Request API : ${request.fields}");
  String reVal = "Fail";
  await request.send().then((response) async {
    await http.Response.fromStream(response).then((onValue) {
      try {
        print("Image Uploading Request API : ${onValue.body}");
      } catch (e) {
        print(e);
      }
      reVal = onValue.body;
    });
  });
  return reVal;
}
