import 'package:tllex/core.dart';
import 'package:dio/dio.dart';
import '{{feature_name.snakeCase()}}_base_datasource.dart';

class {{feature_name.pascalCase()}}ImplDatasource extends {{feature_name.pascalCase()}}BaseDatasource {
    final BaseApiService baseApiService;
    {{feature_name.pascalCase()}}ImplDatasource(this.baseApiService);
   // mason-methods-start

   // mason-methods-end
}
