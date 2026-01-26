class Formatters {
  /// Format distance in km with 1 decimal place
  static String distance(double km) => '${km.toStringAsFixed(1)} km';

  /// Format fare
  static String fare(double amount) => '₱${amount.toStringAsFixed(2)}';

  /// Format duration to minutes
  static String durationMinutes(Duration duration) {
    return '${duration.inMinutes} min';
  }
}
