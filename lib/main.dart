import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SharedPreferencesManager.getDarkModeValue();
//    SharedPreferencesManager.getUserStore();
//    SharedPreferencesManager.getUserLogged();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: Splash(),
    );

    return ChangeNotifierProvider(
      create: (context) => MyTheme(),
      child: Consumer<MyTheme>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: theme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          home: Splash(),
        ),
      ),
    );
  }
}
