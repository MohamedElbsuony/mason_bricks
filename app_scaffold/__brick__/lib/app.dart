import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{project_name.snakeCase()}}/core/design_system/themes/app_theme.dart';
import 'package:{{project_name.snakeCase()}}/core/localization/l10n_cubit.dart';
import 'package:{{project_name.snakeCase()}}/core/router/app_routes.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/controller_provider_setup.dart';

class {{project_name.pascalCase()}}App extends StatelessWidget {
  const {{project_name.pascalCase()}}App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ControllerProviderSetup(
          child: BlocBuilder<L10nCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                title: '{{project_name.titleCase()}}',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.system,
                locale: locale,
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ar', ''),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                routerConfig: AppRoutes.router,
              );
            },
          ),
        );
      },
    );
  }
}
