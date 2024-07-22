import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? _preferences;

  static const _currencyKey = "currency";
  static const _darkModeKey = "dark_mode";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setMainCurrency(String currencyName) async {
    await _preferences?.setString(_currencyKey, currencyName);
  }

  static String? getMainCurrency() {
    return _preferences?.getString(_currencyKey);
  }

  static Future setDarkMode(bool darkMode) async {
    await _preferences?.setBool(_darkModeKey, darkMode);
  }

  static bool? getDarkMode() {
    return _preferences?.getBool(_darkModeKey) ?? false;
  }
}
