import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/post.dart';

const String darkModeKey = 'dark_mode';
bool darkMode = false;

Color kBackgroundDarkColor = Colors.black;
Color kCardDarkColor = Colors.white24;
Color kCardHighlightDarkColor = Colors.black26;
Color kTextDarkColor = Colors.white;
Color kTextSecondaryDarkColor = Colors.white70;

Color kPrimaryColor = Colors.blue[900]; //blue 900
Color kPrimaryLightColor = Colors.blue[800]; //blue 800

Color kBackgroundColor = Colors.grey[200]; //grey 200
Color kCardColor = Colors.white; //white 54
Color kCardHighlightColor = Colors.blue[50]; //blue 50
Color kTextColor = Colors.black;
Color kTextSecondaryColor = Colors.black26;

Color kTabActiveDarkColor = Colors.blueAccent;
Color kTabDarkColor = Colors.white30;
Color kTabActiveColor = Colors.blue;
Color kTabColor = Colors.black26;

final List<Category> listCategories = [
  Category(Image.asset('assets/images/cpp_beginner.png'), 'C++ cơ bản', 2),
  Category(Image.asset('assets/images/java.jpg'), 'Java cơ bản', 2),
];

final List<Post> listPostCppBeginner = [
  Post(
      'Hello World! Chương trình đầu tiên',
      'assets/data/posts/cpp_beginner/bai1.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Các kiểu biến dữ liệu trong C++',
      'assets/data/posts/cpp_beginner/bai2.md',
      'assets/data/posts/cpp_beginner/bai2_tn.md'),
];

final List<Post> listPostJava = [
  Post('Hello World! Chương trình đầu tiên', 'assets/data/cpp_beginner/bai1.md',
      'assets/data/posts/cpp_beginner/bai2_tn.md'),
  Post('Các kiểu biến dữ liệu trong Java', 'assets/data/cpp_beginner/bai2.md',
      'assets/data/posts/cpp_beginner/bai2_tn.md'),
];

Map<int, List<Post>> listPosts = new Map();

class InitData {
  void loadData() {
    SharedPreferencesManager.getDarkModeValue();

    listPosts = {0: listPostCppBeginner, 1: listPostJava};
  }
}
