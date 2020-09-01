import 'package:coding_with_itmc/categories/ui.dart';
import 'package:coding_with_itmc/models/course.dart';
import 'package:flutter/material.dart';

import 'intro_card.dart';

class ListCourses extends StatelessWidget {

  final List<Course> courses;

  ListCourses({Key key, this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          return _cardItem(context, index);
        });
  }

  Widget _cardItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: IntroCard(
        courses[index].backgroundcolor,
        courses[index].title,
        courses[index].description,
        courses[index].numPosts,
        courses[index].numStudents,
        courses[index].stars,
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListPostsPage(index),
          ),
        ),
      ),
    );
  }
}
