import 'package:get_it/get_it.dart';
import 'package:{{project_name.snakeCase()}}/core/network/base_api_service.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/data/datasource/base/sample_base_datasource.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/data/datasource/implementation/sample_impl_datasource.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/data/repository_implementation/sample_repo_impl.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/repository/sample_base_repo.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/use_cases/base/sample_base_use_cases.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/use_cases/implementation/sample_impl_use_cases.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/presentation/blocs/sample_cubit.dart';

void initSampleDI(GetIt getIt) {
  // 1. Data Sources
  getIt.registerLazySingleton<SampleBaseDatasource>(
    () => SampleImplDatasource(getIt<BaseApiService>()),
  );

  // 2. Repositories
  getIt.registerLazySingleton<SampleBaseRepo>(
    () => SampleRepoImpl(getIt<SampleBaseDatasource>()),
  );

  // 3. Use Cases
  getIt.registerLazySingleton<SampleBaseUseCases>(
    () => SampleImplUseCases(getIt<SampleBaseRepo>()),
  );

  // 4. Cubits / Blocs
  getIt.registerFactory<SampleCubit>(
    () => SampleCubit(getIt<SampleBaseUseCases>()),
  );
}
