import 'package:flutter/foundation.dart';

abstract class AppEquatable {
  const AppEquatable();

  List<Object?> get props;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppEquatable &&
        runtimeType == other.runtimeType &&
        listEquals(props, other.props);
  }

  @override
  int get hashCode => Object.hashAll(props);
  
  @override
  String toString() => '$runtimeType($props)';
}
