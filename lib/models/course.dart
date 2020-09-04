import 'package:flutter/material.dart';

class Course{
  int id;
  Color _backgroundColor;
  String _name;
  String _description;
  int _numPosts;
  int _numStudents;
  double _rating;


  Course(this.id, this._backgroundColor, this._name, this._description, this._numPosts,
      this._numStudents, this._rating);

  double get rating => _rating;

  int get numStudents => _numStudents;

  int get numPosts => _numPosts;

  String get description => _description;

  Color get backgroundColor => _backgroundColor;

  String get name => _name;

}