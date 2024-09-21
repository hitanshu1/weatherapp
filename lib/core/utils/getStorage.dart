import 'package:get_storage/get_storage.dart';

/// App storage management using GetStorage
class AppGetXStorage {
  // Private constructor for singleton instance
  const AppGetXStorage._();

  /// Singleton instance
  static const AppGetXStorage instance = AppGetXStorage._();

  /// Storage keys
  /// user data
  static const userDataKey = 'user_data';
  /// token
  static const tokenKey = 'token';
  /// is first time
  static const isFirstTimeKey = 'is_first_time';
  /// tempreature unit
  static const tempUnitKey = 'temp_unit';


  // GetStorage instance
  static final _storage = GetStorage();

  /// Save token to storage
  static void saveToken(String tokenText) {
    _storage.write(tokenKey, tokenText);
  }

  /// Retrieve token from storage
  static String? getToken() {
    return _storage.read(tokenKey);
  }

  /// Save the 'is first time' flag to storage (sets it to false)
  static void saveIsFirstTime() {
    _storage.write(isFirstTimeKey, false);
  }

  /// Retrieve the 'is first time' flag from storage (defaults to true)
  static bool getIsFirstTime() {
    return _storage.read(isFirstTimeKey) ?? true;
  }
  /// save temp unit
  static void saveTempUnit(bool celsius) {
    _storage.write(tempUnitKey, celsius);
  }
  /// get temp unit
  static bool getIsCelsius() {
    return _storage.read(tempUnitKey)??true;
  }

  

  /// Log out the user by removing user data and token from storage.
  static void logout() {
    _storage.remove(userDataKey);
    _storage.remove(tokenKey);
  }
}
