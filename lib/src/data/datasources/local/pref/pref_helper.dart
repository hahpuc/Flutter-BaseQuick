import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const String locale = 'locale';
}

class PrefHelper {
  final SharedPreferences _sharedPreference;
  PrefHelper(this._sharedPreference);

  Future<bool> remove(String key) {
    return _sharedPreference.remove(key);
  }

  bool containsKey(String key) {
    return _sharedPreference.containsKey(key);
  }

  String? getString(String key) {
    return _sharedPreference.getString(key);
  }

  Future<void> setString(String key, String value) {
    return _sharedPreference.setString(key, value);
  }
}
