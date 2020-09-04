import 'package:coding_with_itmc/models/user.dart';
import 'package:flutter/material.dart';

import 'models/course.dart';
import 'models/lesson.dart';

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

final lightTheme = ThemeData(
  canvasColor: kBackgroundColor,
  cardColor: kCardColor,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkTheme = ThemeData(
  canvasColor: kBackgroundDarkColor,
  cardColor: kCardDarkColor,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

String urlApi = 'https://itmc.herokuapp.com/api/v1';

String urlUserProfile = urlApi + '/user/profile';

String urlAuthSignUp = urlApi + '/auth/signup';
String urlAuthLogin = urlApi + '/auth/login';
String urlAuthGoogle = urlApi + '/auth/google';
String urlAuthGithub = urlApi + '/auth/github';

String urlCourse = urlApi + '/course';

String token;

User user = new User();
UserLogin userLogin = new UserLogin(false, "", "");
UserStore userStore = new UserStore("", "");

UserStore userSignUp;

final List<Lesson> listLessonsCppBeginner = [
  Lesson('Cấu trúc chương trình C++', 'assets/data/posts/cpp_beginner/hello.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Các kiểu dữ liệu ', 'assets/data/posts/cpp_beginner/kdl.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Biến và hằng', 'assets/data/posts/cpp_beginner/bien.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Ép kiểu dữ liệu', 'assets/data/posts/cpp_beginner/ekdl.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Toán tử', 'assets/data/posts/cpp_beginner/toantu.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson(
      'Các hàm toán học cơ bản (cmath)',
      'assets/data/posts/cpp_beginner/cmath.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Câu lệnh điều kiện (if else)', 'assets/data/posts/cpp_beginner/if.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson(
      'Câu lệnh rẽ nhánh (switch case)',
      'assets/data/posts/cpp_beginner/switch.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Vòng lặp While - Do While', 'assets/data/posts/cpp_beginner/while.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Vòng lặp For', 'assets/data/posts/cpp_beginner/for.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Mảng một chiều', 'assets/data/posts/cpp_beginner/mang.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Kiểu kí tự (char)', 'assets/data/posts/cpp_beginner/kt.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Kiểu chuỗi (string)', 'assets/data/posts/cpp_beginner/string.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
  Lesson('Hàm', 'assets/data/posts/cpp_beginner/ham.md',
      'assets/data/posts/cpp_beginner/bai1_tn.md'),
];

final List<Lesson> listLessonsJava = [
  Lesson('Hello World! Chương trình đầu tiên', 'assets/data/cpp_beginner/bai1.md',
      'assets/data/posts/cpp_beginner/bai2_tn.md'),
  Lesson('Các kiểu biến dữ liệu trong Java', 'assets/data/cpp_beginner/bai2.md',
      'assets/data/posts/cpp_beginner/bai2_tn.md'),
];

final List<Lesson> listLessonsEmpty = [];

final List<Course> listCoursesBasic = [
  Course(
    100,
      Colors.deepOrangeAccent,
      'C++ cơ bản',
      'Khóa học C++ cơ bản, tạo nền tảng lập trình cho người mới bắt đầu học.',
      listLessonsCppBeginner.length,
      48,
      5),
  Course(
    101,
      Colors.blue,
      'Java cơ bản',
      'Khóa học Java cơ bản, tạo nền tảng lập trình cho android + backend web',
      listLessonsJava.length,
      24,
      4),
];

final List<Course> listCoursesWeb = [
  Course(
    200,
      Colors.green,
      'Front-end',
      'Xây dựng giao diện website của bạn.',
      0,
      0,
      4),
];

final List<Course> listCoursesMobile = [
  Course(
    300,
      Colors.indigo,
      'Android',
      'Lập trình ứng dụng di động Android cơ bản.',
      0,
      0,
      5),
  Course(
    301,
      Colors.pinkAccent,
      'IOS',
      'Thử sức với Ios, tại sao không?',
      0,
      0,
      2),
  Course(
    302,
      Colors.yellow,
      'Flutter',
      'Xây dựng app đa nền tảng bao gồm andorid, ios và cả web app.',
      0,
      0,
      4),
];

Map<int, List<Lesson>> listLessons = new Map();

class InitData {
  void loadData() {
    listLessons = {
      listCoursesBasic[0].id: listLessonsCppBeginner,
      listCoursesBasic[1].id: listLessonsJava,
      listCoursesWeb[0].id : listLessonsEmpty,
      listCoursesMobile[0].id : listLessonsEmpty,
      listCoursesMobile[1].id : listLessonsEmpty,
      listCoursesMobile[2].id : listLessonsEmpty,
    };
  }
}
