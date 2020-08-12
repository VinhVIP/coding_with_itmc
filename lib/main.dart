import 'package:flutter/material.dart';

import 'lib/shared_preference.dart';
import 'splashscreen.dart';

void main() {
//  SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
  SharedPreferencesManager.getDarkModeValue();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
