import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/base_local_storage.dart';

class SecureStorage implements BaseLocalStorage {
  final FlutterSecureStorage storage;

  SecureStorage(this.storage);

  @override
  Future<void> saveString(String key, String value) async {
    await storage.write(key: key, value: value);
    log("✅ Saved in secure storage: $key = $value");
  }

  @override
  Future<String?> getString(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await storage.write(key: key, value: value.toString());
    log("✅ Saved in secure storage: $key = $value");
  }

  @override
  Future<bool?> getBool(String key) async {
    final value = await storage.read(key: key);
    if (value == null) return null;
    return value == 'true';
  }

  @override
  Future<void> remove(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await storage.deleteAll();
  }
}
