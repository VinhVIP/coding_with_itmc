
import 'package:flutter/material.dart';

class MyTheme extends ChangeNotifier{
  bool _isDarkTheme = false;

  void changeTheme(){
    _isDarkTheme = !_isDarkTheme;
  }

  bool get isDarkTheme => _isDarkTheme;
}