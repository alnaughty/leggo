class Validators {
  static bool isValidEmail(String? email) {
    if (email == null || email.isEmpty) return false;
    final regex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );

    return regex.hasMatch(email);
  }

  static bool isValidPHPhone(String? phone) {
    if (phone == null || phone.isEmpty) return false;
    final regex = RegExp(r'^(\+63|63|0)9\d{9}$');

    return regex.hasMatch(phone);
  }

  static bool isNotEmpty(String? text) =>
      text != null && text.trim().isNotEmpty;

  static bool isPositiveNumber(num? n) => n != null && n > 0;
}
