enum Flavor { dev, staging, prod }

class F {
  static late Flavor current;

  static bool get isDev => current == Flavor.dev;
  static bool get isStaging => current == Flavor.staging;
  static bool get isProd => current == Flavor.prod;

  static String get baseUrl {
    switch (current) {
      case Flavor.dev:
        return 'https://dev-api.example.com';
      case Flavor.staging:
        return 'https://staging-api.example.com';
      case Flavor.prod:
        return 'https://api.example.com';
    }
  }
}
