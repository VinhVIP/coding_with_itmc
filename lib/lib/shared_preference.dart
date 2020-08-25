import 'package:coding_with_itmc/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  static void saveDarkModeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkModeKey, darkMode);
    print('dark mode save: $darkMode');
  }

  static getDarkModeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darkMode = prefs.getBool(darkModeKey) ?? false;
    print('dark mode: $darkMode');
  }

  static getUserValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.email = prefs.getString('user_email') ?? '';
    user.pass = prefs.getString('user_pass') ?? '';
  }

  static saveUserLogin(String email, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', email);
    prefs.setString('user_pass', pass);
  }
}
