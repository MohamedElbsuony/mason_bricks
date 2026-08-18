import 'package:{{project_name.snakeCase()}}/features/sample/data/models/sample_model.dart';

abstract class SampleBaseDatasource {
  Future<SampleModel> fetchSampleData(int id);
}
