
import '../../domain/base_repo/{{feature_name.snakeCase()}}_base_repo.dart';
import 'package:tllex_app/core.dart';
import '../datasource/{{feature_name.snakeCase()}}_base_datasource.dart';

class {{feature_name.pascalCase()}}ImplRepo extends {{feature_name.pascalCase()}}BaseRepo {
  final {{feature_name.pascalCase()}}BaseDatasource {{feature_name.snakeCase()}}BaseDatasource;

  {{feature_name.pascalCase()}}ImplRepo(this.{{feature_name.snakeCase()}}BaseDatasource);

    // mason-methods-start
 
   // mason-methods-end
}
