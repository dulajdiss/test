// local_storage_service.dart:
// In this file, we write all the code needed to store and get data from the local storage using the plugin
// shared_preferences.In this file, there will be getters and setters for each and every data to be stored in the local storage.

import 'dart:convert';
import 'package:ebbf/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future save(String key, value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, json.encode(value));
}

Future read(String key) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString(key) != null) {
    return json.decode(prefs.getString(key) ?? '');
  } else {
    return null;
  }
}

Future deleteSP() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}

class SharedPreferencesConstant {
  static const confirmUser = "confirmUser";
  static const userId = "userId";
  static const fullName = "fullName";
  static const mobile = "mobile";
  static const userType = "userType";
  static const email = "email";
  static const eventFee = "eventFee";
}

Future<UserModel> readUserData() async {
  return UserModel(
      message: "Empty",
      success: 1,
      userId: await read(SharedPreferencesConstant.userId),
      fullname: await read(SharedPreferencesConstant.fullName),
      mobile: await read(SharedPreferencesConstant.mobile),
      userType: await read(SharedPreferencesConstant.userType),
      email: await read(SharedPreferencesConstant.email));
}

Future<void> saveUserData(UserModel user) async {
  await save(SharedPreferencesConstant.confirmUser, user.userId);
  await save(SharedPreferencesConstant.userId, user.userId);
  await save(SharedPreferencesConstant.fullName, user.fullname);
  await save(SharedPreferencesConstant.mobile, user.mobile);
  await save(SharedPreferencesConstant.userType, user.userType);
  await save(SharedPreferencesConstant.email, user.email);
}
