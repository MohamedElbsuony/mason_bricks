import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/app/routes/sample_routes.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = SampleRoutes.sampleScreen;

  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      ...SampleRoutes.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.uri.path}'),
      ),
    ),
  );
}
