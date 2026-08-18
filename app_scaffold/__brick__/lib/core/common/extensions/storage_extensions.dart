import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/base_local_storage.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/storage_service.dart';

extension StorageServiceExtension on BuildContext {
  BaseLocalStorage get shared => StorageService.shared;
  BaseLocalStorage get secure => StorageService.secure;
  Future<void> clearStorage() => StorageService.clearAll();
}
