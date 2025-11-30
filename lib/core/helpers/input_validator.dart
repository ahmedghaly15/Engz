class InputValidator {
  InputValidator._();

  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }
}
