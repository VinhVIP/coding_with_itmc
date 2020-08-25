import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: LoginScreen(),
      title: Text(
        'Coding with iTMC',
        style:
            TextStyle(fontFamily: 'Lobster', fontSize: 23, color: Colors.white, letterSpacing: 1.5),
      ),
      image: Image.asset("assets/images/itmc.png"),
      photoSize: 150,
      backgroundColor: kPrimaryColor,
      loaderColor: Colors.white70,
      onClick: () {},
    );
  }
}
