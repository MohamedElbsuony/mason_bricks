import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:{{project_name.snakeCase()}}/app.dart';
import 'package:{{project_name.snakeCase()}}/core/app_injection/app_injection.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment configuration
  try {
    await dotenv.load(fileName: 'assets/env/dev.env');
  } catch (_) {
    // Fallback if dotenv file is missing
  }

  // Initialize dependency injection
  await setupAppInjection();
  
  // Initialize local storage service
  await StorageService.init();

  runApp(const {{project_name.pascalCase()}}App());
}
