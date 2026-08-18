import 'dart:developer';

import 'package:{{project_name.snakeCase()}}/core/app_injection/app_injection.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/base_local_storage.dart';

class StorageService {
  static late BaseLocalStorage _shared;
  static late BaseLocalStorage _secure;

  // Initialize once after DI setup
  static Future<void> init() async {
    _shared = getIt<BaseLocalStorage>();
    _secure = getIt<BaseLocalStorage>(instanceName: 'secure');
    log("✅ StorageService initialized");
  }

  // Getters
  static BaseLocalStorage get shared => _shared;
  static BaseLocalStorage get secure => _secure;

  // Clear all
  static Future<void> clearAll() async {
    await _shared.clear();
    await _secure.clear();
    log("✅ All storage cleared");
  }
}
