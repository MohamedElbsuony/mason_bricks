import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/use_cases/base/sample_base_use_cases.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/presentation/blocs/sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  final SampleBaseUseCases sampleUseCases;

  SampleCubit(this.sampleUseCases) : super(SampleInitial());

  Future<void> loadSampleData(int id) async {
    emit(SampleLoading());
    final result = await sampleUseCases.getSampleData(id);

    result.fold(
      (failure) => emit(SampleError(failure.message)),
      (data) => emit(SampleLoaded(data)),
    );
  }
}
