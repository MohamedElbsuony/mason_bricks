import 'package:{{project_name.snakeCase()}}/core/network/base_api_service.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/storage_keys.dart';
import 'package:{{project_name.snakeCase()}}/core/storage/storage_service.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/data/datasource/base/sample_base_datasource.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/data/models/sample_model.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/inputs/sample_inputs.dart';

class SampleImplDatasource extends SampleBaseDatasource {
  final BaseApiService baseApiService;

  SampleImplDatasource(this.baseApiService);

  @override
  Future<SampleModel> fetchSampleData(SampleInputs inputs) async {
    // Demo storage usage: save & read sample key
    await StorageService.shared.saveString(StorageKeys.userName, 'Clean Arch User');
    final cachedUser = await StorageService.shared.getString(StorageKeys.userName);

    // Demo implementation (Simulated response or BaseApiService call)
    await Future.delayed(const Duration(milliseconds: 800));
    return SampleModel(
      id: inputs.id,
      title: 'Sample Feature Title #${inputs.id}',
      description: 'Fetched for $cachedUser through Clean Architecture pipeline (BaseApiService -> RepoImpl -> UseCases -> Cubit -> UI)',
    );
  }
}

