import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system);
  void init(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    state = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggle() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }

  void setMode(ThemeMode mode) {
    state = mode;
  }
}
