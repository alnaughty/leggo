import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, staging, prod }

class F {
  static late Flavor current;

  static bool get isDev => current == Flavor.dev;
  static bool get isStaging => current == Flavor.staging;
  static bool get isProd => current == Flavor.prod;

  static String get baseUrl {
    return dotenv.env['BASE_DOMAIN'] ?? "";
  }

  static String get sha256Base64Hash {
    return dotenv.env['SHA256_BASE64'] ?? "";
  }
}
