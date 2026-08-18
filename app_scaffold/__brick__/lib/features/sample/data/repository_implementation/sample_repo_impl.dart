import 'package:dartz/dartz.dart';
import 'package:{{project_name.snakeCase()}}/core/network/error_handler.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/data/datasource/base/sample_base_datasource.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/entities/sample_entity.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/repository/sample_base_repo.dart';

class SampleRepoImpl implements SampleBaseRepo {
  final SampleBaseDatasource remoteDatasource;

  SampleRepoImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, SampleEntity>> getSampleData(int id) async {
    try {
      final result = await remoteDatasource.fetchSampleData(id);
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
