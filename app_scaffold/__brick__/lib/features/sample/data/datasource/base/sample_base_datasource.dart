import 'package:{{project_name.snakeCase()}}/features/sample/data/models/sample_model.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/inputs/sample_inputs.dart';

abstract class SampleBaseDatasource {
  Future<SampleModel> fetchSampleData(SampleInputs inputs);
}

