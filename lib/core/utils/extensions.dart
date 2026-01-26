extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension NumExtensions on num {
  String toCurrency({String symbol = '₱'}) {
    return '$symbol${toStringAsFixed(2)}';
  }
}
