import 'package:curverto_flutter/utils/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void initializeTheme() {
    _darkTheme = SharedPreferencesService.getDarkMode() ?? false;
    notifyListeners();
  }

  void toggleTheme() {
    _darkTheme = !darkTheme;
    SharedPreferencesService.setDarkMode(darkTheme);
    notifyListeners();
  }
}
