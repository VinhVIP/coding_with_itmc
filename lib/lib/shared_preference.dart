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

  static saveUserStore(String email, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userStore.email = email;
    userStore.pass = pass;

    prefs.setString('user_store_email', email);
    prefs.setString('user_store_pass', pass);
  }

  static getUserStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userStore.email = prefs.getString('user_store_email') ?? '';
    userStore.pass = prefs.getString('user_store_pass') ?? '';

    print('User Store: ${userStore.email} - ${userStore.pass}');
  }

  static saveUserLogged(bool isLogged, String email, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userLogin.isLogged = isLogged;
    userLogin.email = email;
    userLogin.pass = pass;

    prefs.setBool('user_is_logged', isLogged);
    prefs.setString('user_logged_email', email);
    prefs.setString('user_logged_pass', pass);
  }

  static getUserLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userLogin.isLogged = prefs.getBool('user_is_logged') ?? false;
    userLogin.email = prefs.getString('user_logged_email') ?? '';
    userLogin.pass = prefs.getString('user_logged_pass') ?? '';

    print(
        'User Logged: ${userLogin.isLogged} ${userLogin.email} - ${userLogin.pass}');
  }
}
