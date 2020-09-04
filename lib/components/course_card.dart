import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseCard extends StatelessWidget {

  Color kBackground;
  String name, description;
  int numLessons, numStudents;
  double rating;
  Function tap;

  CourseCard(this.kBackground, this.name, this.description, this.numLessons,
      this.numStudents, this.rating, this.tap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Column(
          children: <Widget>[
            Container(
              width: 220,
              height: 100,
              color: kBackground,
              child: Center(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25, fontFamily: 'Oswald'), )),
            ),
            Container(
              width: 220,
              height: 150,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Oswald'),),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.add_to_queue, size: 18,),
                            SizedBox(width: 10),
                            Text('$numLessons bài học', style: TextStyle(fontFamily: 'Oswald'),),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Icon(Icons.person_outline, size: 18,),
                            SizedBox(width: 10),
                            Text('$numStudents học viên', style: TextStyle(fontFamily: 'Oswald'),),
                          ],
                        ),
                        SizedBox(height: 5),
                        _buildRatingStar(),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildRatingStar(){
    int stars = rating.toInt();
    return Row(
      children: <Widget>[
        for(int i=0; i<stars; i++) Icon(Icons.star,  color: Colors.yellow, size: 18,),
        for(int i=stars; i<5; i++) Icon(Icons.star_border, color: Colors.grey, size: 18,),
      ],
    );
  }
}
