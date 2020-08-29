import 'dart:io';

import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/home/ui.dart';
import 'package:coding_with_itmc/login/login_model.dart';
import 'package:coding_with_itmc/login/login_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lib/shared_preference.dart';
import 'models/notification.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashState();
  }
}

class _SplashState extends State<Splash> {
  Notify _notify;

  @override
  void initState() {
    _login();
    super.initState();
  }

  _checkInternetConnection() async {
    print('dm');
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  _login() async {
    await SharedPreferencesManager.getDarkModeValue();
    await SharedPreferencesManager.getUserLogged();
    await SharedPreferencesManager.getUserStore();

    if (userLogin.isLogged) {
      LoginModel().requestLogin(userLogin.email, userLogin.pass).then((value) {
        if (value.code == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Image.asset('assets/images/itmc.png'),
      ),
    );
  }

}
