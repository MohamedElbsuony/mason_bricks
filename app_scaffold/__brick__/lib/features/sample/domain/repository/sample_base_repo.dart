import 'package:dartz/dartz.dart';
import 'package:{{project_name.snakeCase()}}/core/network/error_handler.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/entities/sample_entity.dart';

abstract class SampleBaseRepo {
  Future<Either<Failure, SampleEntity>> getSampleData(int id);
}
