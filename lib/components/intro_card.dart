import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroCard extends StatelessWidget {

  Color kBackground;
  String title, description;
  int numLessons, numStudents;
  double stars;
  Function tap;

  IntroCard(this.kBackground, this.title, this.description, this.numLessons,
      this.numStudents, this.stars, this.tap);

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
              child: Center(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25, fontFamily: 'Oswald'), )),
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
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow, size: 18,),
                            Icon(Icons.star, color: Colors.yellow, size: 18,),
                            Icon(Icons.star, color: Colors.yellow, size: 18,),
                            Icon(Icons.star_half, color: Colors.yellow, size: 18,),
                            Icon(Icons.star_border, color: Colors.grey, size: 18,),
                          ],
                        ),
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
}
