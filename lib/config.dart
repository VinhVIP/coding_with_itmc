import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/post.dart';

//MaterialColor kPrimaryColor = Colors.blue[800];  //blue 800
//MaterialColor kBackgroundColor = Colors.grey[50]; //grey 50
//MaterialColor kCardColor = Colors.white54;   //white 54
//MaterialColor kCardHighlightColor = Colors.blue[50]; //blue 50

final List<Category> listCategories = [
  Category(Image.asset('assets/images/cpp_beginner.png'), 'C++ cơ bản', 0),
  Category(Image.asset('assets/images/java.jpg'), 'Java cơ bản', 0),
];

final List<Post> listPostCppBeginner = [
  Post(
      'Hello World! Chương trình đầu tiên', 'assets/data/posts/cpp_beginner/bai1.md'),
  Post('Các kiểu biến dữ liệu trong C++', 'assets/data/posts/cpp_beginner/bai2.md'),
];

final List<Post> listPostJava = [
  Post(
      'Hello World! Chương trình đầu tiên', 'assets/data/cpp_beginner/bai1.md'),
  Post('Các kiểu biến dữ liệu trong Java', 'assets/data/cpp_beginner/bai2.md'),
];

Map<int, List<Post>> listPosts = new Map();

class InitData{
  void loadData(){
    listPosts = {0: listPostCppBeginner, 1:listPostJava};
  }
}