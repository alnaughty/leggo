class Validators {
  static bool isValidEmail(String? email) {
    if (email == null) return false;
    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return regex.hasMatch(email);
  }

  static bool isValidPhone(String? phone) {
    if (phone == null) return false;
    final regex = RegExp(r'^\+?\d{10,15}$');
    return regex.hasMatch(phone);
  }

  static bool isNotEmpty(String? text) =>
      text != null && text.trim().isNotEmpty;

  static bool isPositiveNumber(num? n) => n != null && n > 0;
}
