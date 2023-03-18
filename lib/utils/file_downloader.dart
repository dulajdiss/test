import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<File> loadPdfFromNetwork(String url) async {
  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;
  print('$url');
  return _storeFile(url, bytes);
}

Future<File> _storeFile(String url, List<int> bytes) async {
  final filename = basename(url);
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir?.path}/$filename');
  await file.writeAsBytes(bytes, flush: true);
  print('$file');

  return file;
}

// Future<bool> downloaderFile(String url, String fileName) async {
//   try {
//     if (await _requestPermission(Permission.storage)) {
//       Directory? directory;
//       directory = await getExternalStorageDirectory();
//       String newPath = "";
//       List<String> paths = directory!.path.split("/");
//       for (int x = 1; x < paths.length; x++) {
//         String folder = paths[x];
//         if (folder != "Android") {
//           newPath += "/" + folder;
//         } else {
//           break;
//         }
//       }
//       newPath = newPath + "/PDF_Download";
//       directory = Directory(newPath);
//
//       File saveFile = File(directory.path + "/$fileName");
//       if (kDebugMode) {
//         print(saveFile.path);
//       }
//       if (!await directory.exists()) {
//         await directory.create(recursive: true);
//       }
//       if (await directory.exists()) {
//         await Dio().download(
//           url,
//           saveFile.path,
//         );
//       }
//     }
//     return true;
//   } catch (e) {
//     return false;
//   }
// }
