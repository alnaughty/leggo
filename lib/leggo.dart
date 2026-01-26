import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leggo/app_router.dart';
import 'package:leggo/core/providers/theme_provider.dart';
import 'package:leggo/core/utils/flavors.dart' show F, Flavor;
import 'package:leggo/core/utils/themes.dart';

class Leggo extends ConsumerStatefulWidget {
  const Leggo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LeggoState();
}

class _LeggoState extends ConsumerState<Leggo> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(themeModeProvider.notifier).init(context);
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: 'Leggo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter.router,
      debugShowCheckedModeBanner: F.current == Flavor.dev,
    );
  }
}
