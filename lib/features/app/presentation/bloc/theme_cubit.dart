import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void init(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    emit(brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggle() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  void setMode(ThemeMode mode) {
    emit(mode);
  }
}
