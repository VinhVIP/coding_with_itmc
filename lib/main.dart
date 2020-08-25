import 'package:flutter/material.dart';

import 'lib/shared_preference.dart';
import 'splashscreen.dart';

void main() {
  runApp(MyApp());
}

final lightTheme = ThemeData(
  canvasColor: Colors.white,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkTheme = ThemeData(
  canvasColor: Colors.black,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharedPreferencesManager.getDarkModeValue();
    SharedPreferencesManager.getUserValue();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: Splash(),
    );
  }
}
