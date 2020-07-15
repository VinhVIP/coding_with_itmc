import 'package:coding_with_itmc/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
//    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Coding with iTMC',
        style: GoogleFonts.galada(
            fontSize: 23, letterSpacing: 2.5, color: Colors.white70),
      ),
      image: Image.asset("assets/images/itmc.png"),
      photoSize: 150,
      backgroundColor: kPrimaryColor,
      loaderColor: Colors.white70,
      onClick: () {},
    );
  }
}
