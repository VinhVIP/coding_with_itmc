import 'package:coding_with_itmc/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home/ui.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      title: Text(
        "Coding With ITMC",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blueAccent),
      ),
      image: Image.asset("assets/images/itmc.png"),
      photoSize: 150,
      backgroundColor:  Colors.grey[50],
      loaderColor: Colors.blueAccent,
      onClick: () {},
    );
  }
}
