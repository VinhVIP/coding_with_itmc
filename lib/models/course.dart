import 'package:flutter/material.dart';

class Course{
  int id;
  Color _backgroundColor;
  String _title;
  String _description;
  int _numPosts;
  int _numStudents;
  double _stars;


  Course(this.id, this._backgroundColor, this._title, this._description, this._numPosts,
      this._numStudents, this._stars);

  double get stars => _stars;

  int get numStudents => _numStudents;

  int get numPosts => _numPosts;

  String get description => _description;

  Color get backgroundColor => _backgroundColor;

  String get title => _title;

  Color get backgroundcolor => _backgroundColor;
}