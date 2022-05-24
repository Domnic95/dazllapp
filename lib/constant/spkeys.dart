// ignore_for_file: non_constant_identifier_names

import 'package:dazllapp/config/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static String key_keep_me_logged_in = "keep_me_logged_in";
  static String key_current = "current";
  static String key_token = "token";
}

class SpHelpers {
  static setPref(String name, String data) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(name, data);
  }

  static removePref() {
    sharedPreferences.clear();
  }

  static int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  static setInt(String key, int value) {
    sharedPreferences.setInt(key, value);
  }

  static bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  static setBool(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }

  static String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  static setString(String key, String val) {
    sharedPreferences.setString(key, val);
  }
}
