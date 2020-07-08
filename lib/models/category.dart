import 'package:flutter/material.dart';

class Category{
  Image _icon;
  String _title;
  int _numPosts;

  Category(this._icon, this._title, this._numPosts);

  int get numPosts => _numPosts;

  set numPosts(int value) {
    _numPosts = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Image get icon => _icon;

  set icon(Image value) {
    _icon = value;
  }
}