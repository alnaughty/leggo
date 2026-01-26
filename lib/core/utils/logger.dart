class CLogger {
  static void log(String message, {String tag = 'APP'}) {
    final time = DateTime.now().toIso8601String();
    print('[$time][$tag] $message');
  }

  static void error(String message, {String tag = 'ERROR'}) {
    final time = DateTime.now().toIso8601String();
    print('[$time][$tag] $message');
  }
}
