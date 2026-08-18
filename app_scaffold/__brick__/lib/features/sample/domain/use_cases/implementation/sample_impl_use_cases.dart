import 'package:dartz/dartz.dart';
import 'package:{{project_name.snakeCase()}}/core/network/error_handler.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/entities/sample_entity.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/repository/sample_base_repo.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/use_cases/base/sample_base_use_cases.dart';

class SampleImplUseCases extends SampleBaseUseCases {
  final SampleBaseRepo repository;

  SampleImplUseCases(this.repository);

  @override
  Future<Either<Failure, SampleEntity>> getSampleData(int id) async {
    return await repository.getSampleData(id);
  }
}
