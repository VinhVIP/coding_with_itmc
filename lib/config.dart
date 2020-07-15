import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/post.dart';

Color kPrimaryColor = Colors.blue[900];  //blue 900
Color kPrimaryLightColor = Colors.blue[800];  //blue 800
Color kBackgroundColor = Colors.grey[200]; //grey 200
Color kCardColor = Colors.white54;   //white 54
Color kCardHighlightColor = Colors.blue[50]; //blue 50

final List<Category> listCategories = [
  Category(Image.asset('assets/images/cpp_beginner.png'), 'C++ cơ bản', 2),
  Category(Image.asset('assets/images/java.jpg'), 'Java cơ bản', 2),
];

final List<Post> listPostCppBeginner = [
  Post(
      'Hello World! Chương trình đầu tiên', 'assets/data/posts/cpp_beginner/bai1.md', 'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Post('Các kiểu biến dữ liệu trong C++', 'assets/data/posts/cpp_beginner/bai2.md', 'assets/data/posts/cpp_beginner/bai2_tn.md'),
];

final List<Post> listPostJava = [
  Post(
      'Hello World! Chương trình đầu tiên', 'assets/data/cpp_beginner/bai1.md', 'assets/data/posts/cpp_beginner/bai2_tn.md'),
  Post('Các kiểu biến dữ liệu trong Java', 'assets/data/cpp_beginner/bai2.md', 'assets/data/posts/cpp_beginner/bai2_tn.md'),
];

Map<int, List<Post>> listPosts = new Map();

class InitData{
  void loadData(){
    listPosts = {0: listPostCppBeginner, 1:listPostJava};
  }
}