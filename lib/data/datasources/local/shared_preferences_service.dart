import 'package:shared_preferences/shared_preferences.dart';

class _SharedPreferencesKeys {
  static const String rememberMe = 'REMEMBER_ME_CHECK';
  static const String firstTime = 'IS_FIRST_TIME';
  static const String email = 'REMEMBER_ME_EMAIL';
  static const String password = 'REMEMBER_ME_PASSWORD';
}

class SharedPreferencesService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> get rememberMe async {
    return _prefs.getBool(_SharedPreferencesKeys.rememberMe) ?? false;
  }

  Future<void> setRememberMe(bool value) async {
    await _prefs.setBool(_SharedPreferencesKeys.rememberMe, value);
  }

  Future<bool> get isFirstTime async {
    return _prefs.getBool(_SharedPreferencesKeys.firstTime) ?? true;
  }

  Future<void> setFirstTime(bool value) async {
    await _prefs.setBool(_SharedPreferencesKeys.firstTime, value);
  }

  Future<String> get email async {
    return _prefs.getString(_SharedPreferencesKeys.email) ?? '';
  }

  Future<void> setEmail(String value) async {
    await _prefs.setString(_SharedPreferencesKeys.email, value);
  }

  Future<String> get password async {
    return _prefs.getString(_SharedPreferencesKeys.password) ?? '';
  }

  Future<void> setPassword(String value) async {
    await _prefs.setString(_SharedPreferencesKeys.password, value);
  }

  Future<void> writeIfNullString(String key, String value) async {
    if (!_prefs.containsKey(key)) {
      await _prefs.setString(key, value);
    }
  }

  Future<void> writeIfNullBool(String key, bool value) async {
    if (!_prefs.containsKey(key)) {
      await _prefs.setBool(key, value);
    }
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
