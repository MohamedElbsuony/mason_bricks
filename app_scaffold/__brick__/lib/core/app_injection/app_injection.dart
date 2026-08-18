import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:{{project_name.snakeCase()}}/core/network/base_api_service.dart';
import 'package:{{project_name.snakeCase()}}/core/network/constants_network.dart';
import 'package:{{project_name.snakeCase()}}/core/network/error_handler.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/base_local_storage.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/shared_prefs_storage.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/secure_storage.dart';
import 'package:{{project_name.snakeCase()}}/core/localization/l10n_cubit.dart';

// Feature DI Modules
import 'package:{{project_name.snakeCase()}}/features/sample/app/di/sample_di.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupAppInjection() async {
  // External
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // Dio Config
  final dio = Dio(
    BaseOptions(
      baseUrl: ConstantsNetwork.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  getIt.registerSingleton<Dio>(dio);

  // Core Storage Implementations
  getIt.registerLazySingleton<BaseLocalStorage>(
    () => SharedPrefsStorage(getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<BaseLocalStorage>(
    () => SecureStorage(getIt<FlutterSecureStorage>()),
    instanceName: 'secure',
  );

  // Core Network & Error Handling
  getIt.registerLazySingleton<ErrorHandler>(() => ErrorHandler());
  getIt.registerLazySingleton<BaseApiService>(
    () => BaseApiServiceImpl(getIt<Dio>()),
  );

  // Core Cubits & Blocs
  getIt.registerFactory<L10nCubit>(() => L10nCubit());

  // ---------------------------------------------------------------------------
  // FEATURE DEPENDENCY INJECTIONS
  // ---------------------------------------------------------------------------
  initSampleDI(getIt);
}
