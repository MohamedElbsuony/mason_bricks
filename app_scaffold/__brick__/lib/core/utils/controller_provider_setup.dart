import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/core/app_injection/app_injection.dart';
import 'package:{{project_name.snakeCase()}}/core/localization/l10n_cubit.dart';

class ControllerProviderSetup extends StatelessWidget {
  final Widget child;

  const ControllerProviderSetup({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<L10nCubit>(
          create: (_) => getIt<L10nCubit>(),
        ),
      ],
      child: child,
    );
  }
}
