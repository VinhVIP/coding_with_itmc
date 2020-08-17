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

Color kBackgroundColor = Color(0xfff5fbfb); //grey 200
Color kCardColor = Colors.white; //white 54
Color kCardHighlightColor = Colors.blue[50]; //blue 50
Color kTextColor = Colors.black;
Color kTextSecondaryColor = Color(0xff5d827e);

Color kTabActiveDarkColor = Colors.blueAccent;
Color kTabDarkColor = Colors.white30;
Color kTabActiveColor = Colors.blue;
Color kTabColor = Colors.black26;


String urlApi = 'https://itmc.herokuapp.com/api/v1';

String urlUserProfile = urlApi + '/user/profile';

String urlAuthSignUp = urlApi + '/auth/signup';
String urlAuthLogin = urlApi + '/auth/login';
String urlAuthGoogle = urlApi + '/auth/google';
String urlAuthGithub = urlApi + '/auth/github';

String urlCourse = urlApi + '/course';

String token;


final List<Post> listPostCppBeginner = [
  Post(
      'Các kiểu dữ liệu trong C++',
      'assets/data/posts/cpp_beginner/kdl.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Biến trong C++',
      'assets/data/posts/cpp_beginner/bien.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Ép kiểu dữ liệu',
      'assets/data/posts/cpp_beginner/ekdl.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Câu lệnh điều kiện (if else)',
      'assets/data/posts/cpp_beginner/if.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Câu lệnh rẽ nhánh (switch case)',
      'assets/data/posts/cpp_beginner/switch.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Vòng lặp While - Do While',
      'assets/data/posts/cpp_beginner/while.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Vòng lặp For',
      'assets/data/posts/cpp_beginner/for.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Mảng một chiều trong C++',
      'assets/data/posts/cpp_beginner/mang.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Kiểu kí tự (char & string)',
      'assets/data/posts/cpp_beginner/kt.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post(
      'Hàm',
      'assets/data/posts/cpp_beginner/ham.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
];

final List<Post> listPostJava = [
  Post('Hello World! Chương trình đầu tiên', 'assets/data/cpp_beginner/bai1.md',
      'assets/data/posts/cpp_beginner/bai2_tn.md'),
  Post('Các kiểu biến dữ liệu trong Java', 'assets/data/cpp_beginner/bai2.md',
      'assets/data/posts/cpp_beginner/bai2_tn.md'),
];

final List<Category> listCategories = [
  Category(Image.asset('assets/images/cpp_beginner.png'), 'C++ cơ bản', listPostCppBeginner.length),
  Category(Image.asset('assets/images/java.jpg'), 'Java cơ bản', listPostJava.length),
];

Map<int, List<Post>> listPosts = new Map();

class InitData {
  void loadData() {
    listPosts = {0: listPostCppBeginner, 1: listPostJava};
  }
}
