import 'package:flutter/material.dart';
import 'package:leggo/core/di/injection.dart';
import 'package:leggo/core/utils/flavors.dart';
import 'package:leggo/leggo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavorString = String.fromEnvironment('FLAVOR');
  final bool hasEnv = bool.hasEnvironment("FLAVOR");
  print("CHECK HAS FLAVOR : $hasEnv");
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
  final envFile = switch (F.current) {
    Flavor.dev => '.env.dev',
    Flavor.staging => '.env.staging',
    _ => '.env',
  };
  print("FLAVOR : $flavorString");
  await dotenv.load(fileName: envFile);
  configureDependencies();
  runApp(const Leggo());
}
