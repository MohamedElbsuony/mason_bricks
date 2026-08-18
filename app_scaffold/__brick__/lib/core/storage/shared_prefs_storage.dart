import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/base_local_storage.dart';

class SharedPrefsStorage implements BaseLocalStorage {
  final SharedPreferences prefs;

  SharedPrefsStorage(this.prefs);

  @override
  Future<void> saveString(String key, String value) async {
    await prefs.setString(key, value);
    log("✅ Saved in shared storage: $key = $value");
  }

  @override
  Future<String?> getString(String key) async {
    return prefs.getString(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await prefs.setBool(key, value);
    log("✅ Saved in shared storage: $key = $value");
  }

  @override
  Future<bool?> getBool(String key) async {
    return prefs.getBool(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await prefs.clear();
  }
}
