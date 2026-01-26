import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leggo/core/utils/flavors.dart';
import 'package:leggo/leggo.dart';

void main() {
  runApp(ProviderScope(child: const Leggo()));
  const flavorString = String.fromEnvironment('FLAVOR');
  switch (flavorString) {
    case 'dev':
      F.current = Flavor.dev;
      break;
    case 'staging':
      F.current = Flavor.staging;
      break;
    case 'prod':
    default:
      F.current = Flavor.prod;
  }
}
