/// validation service
class ValidationService {
  ValidationService._();

/// Validates email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    } else if (value.length < 6) {
      return 'Email must be at least 6 characters';
    } else if (!value.contains('@')) {
      return 'Email must contain @';
    }
    return null;
  }

  /// validates password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  /// validates name 
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }
}
