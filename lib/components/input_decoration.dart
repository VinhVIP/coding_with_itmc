import 'package:flutter/material.dart';

import '../config.dart';

InputDecoration customInputBorder({String labelText, String hintText, String errorText}){
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.green,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    labelStyle: TextStyle(
      color: darkMode ? kTextDarkColor : kTextColor,
    ),
    labelText: labelText,
    hintText: hintText,
    errorText: errorText,
  );
}