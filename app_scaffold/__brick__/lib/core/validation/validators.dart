class AppValidators {
  AppValidators._();

  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? "Field"} is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength, {String? fieldName}) {
    if (value == null || value.length < minLength) {
      return '${fieldName ?? "Field"} must be at least $minLength characters';
    }
    return null;
  }
}
