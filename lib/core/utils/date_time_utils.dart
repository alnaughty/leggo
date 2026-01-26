class DateTimeUtils {
  /// Format to HH:mm
  static String formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  /// Format to yyyy-MM-dd
  static String formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  /// Calculate ETA (duration) between two times
  static Duration eta(DateTime start, DateTime end) => end.difference(start);

  /// Convert timestamp to DateTime
  static DateTime fromMilliseconds(int ms) =>
      DateTime.fromMillisecondsSinceEpoch(ms);
}
