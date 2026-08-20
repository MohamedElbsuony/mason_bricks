import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/core/app_injection/app_injection.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/domain/inputs/sample_inputs.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/presentation/blocs/sample_cubit.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/presentation/ui/screens/sample_screen.dart';

class SampleRoutes {
  SampleRoutes._();

  static const String sampleScreen = '/sample';

  static List<RouteBase> get routes => [
        GoRoute(
          path: sampleScreen,
          name: 'sample',
          builder: (context, state) => BlocProvider<SampleCubit>(
            create: (_) => getIt<SampleCubit>()..loadSampleData(const SampleInputs(id: 1)),
            child: const SampleScreen(),
          ),
        ),
      ];
}

