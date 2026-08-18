import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/entities/sample_entity.dart';

abstract class SampleState extends Equatable {
  const SampleState();

  @override
  List<Object?> get props => [];
}

class SampleInitial extends SampleState {}

class SampleLoading extends SampleState {}

class SampleLoaded extends SampleState {
  final SampleEntity data;

  const SampleLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class SampleError extends SampleState {
  final String message;

  const SampleError(this.message);

  @override
  List<Object?> get props => [message];
}
