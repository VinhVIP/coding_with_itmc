import 'package:coding_with_itmc/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  static void saveDarkModeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkModeKey, darkMode);
  }

  static getDarkModeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darkMode = prefs.getBool(darkModeKey) ?? false;
  }
}
