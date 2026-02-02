import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leggo/app_router.dart';
import 'package:leggo/core/di/injection.dart';
import 'package:leggo/core/utils/flavors.dart' show F, Flavor;
import 'package:leggo/core/utils/themes.dart';
import 'package:leggo/features/app/presentation/bloc/theme_cubit.dart';

class Leggo extends StatelessWidget {
  const Leggo({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>()..init(context),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Leggo',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeMode,
            routerConfig: appRouter.router,
            debugShowCheckedModeBanner: F.current == Flavor.dev,
          );
        },
      ),
    );
  }
}
