import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/debug_logger.dart';

abstract class CacheHelper {
  Future<bool> setData(String key, value);
  Future<bool?> getBool(String key);
  Future<String?> getString(String key);
  Future<int?> getInt(String key);
  Future<double?> getDouble(String key);
  Future<bool> removeData(String key);
  Future<bool> clearData();
}

class SharedPrefHelper implements CacheHelper {
  final SharedPreferences _sharedPref;

  SharedPrefHelper(this._sharedPref);

  /// Removes a value from SharedPreferences with given [key].
  @override
  Future<bool> removeData(String key) async {
    DebugLogger.log('SharedPrefHelper : data with key : $key has been removed');
    return _sharedPref.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  @override
  Future<bool> clearData() async {
    DebugLogger.log('SharedPrefHelper : all data has been cleared');
    return _sharedPref.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  @override
  Future<bool> setData(String key, value) async {
    DebugLogger.log(
      "SharedPrefHelper : setData with key : $key and value : $value",
    );
    switch (value.runtimeType) {
      case const (String):
        return await _sharedPref.setString(key, value);
      case const (int):
        return await _sharedPref.setInt(key, value);
      case const (bool):
        return await _sharedPref.setBool(key, value);
      case const (double):
        return await _sharedPref.setDouble(key, value);
      default:
        return false;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  @override
  Future<bool?> getBool(String key) async {
    DebugLogger.log('SharedPrefHelper : getBool with key : $key');
    return _sharedPref.getBool(key);
  }

  /// Gets a double value from SharedPreferences with given [key].
  @override
  Future<double?> getDouble(String key) async {
    DebugLogger.log('SharedPrefHelper : getDouble with key : $key');
    return _sharedPref.getDouble(key);
  }

  /// Gets an int value from SharedPreferences with given [key].
  @override
  Future<int?> getInt(String key) async {
    DebugLogger.log('SharedPrefHelper : getInt with key : $key');
    return _sharedPref.getInt(key);
  }

  /// Gets an String value from SharedPreferences with given [key].
  @override
  Future<String?> getString(String key) async {
    DebugLogger.log('SharedPrefHelper : getString with key : $key');
    return _sharedPref.getString(key);
  }
}
