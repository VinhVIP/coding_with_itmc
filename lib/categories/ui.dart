import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/post/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListPostsPage extends StatelessWidget {
  final int categoryIndex;

  ListPostsPage(this.categoryIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, listCoursesBasic[categoryIndex].title),
//      backgroundColor: darkMode ? kBackgroundDarkColor : kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(child: ListPosts(categoryIndex)),
        ],
      ),
    );
  }

  _buildAppBar(BuildContext context, String title) {
    Widget leading = IconButton(
      color: Colors.white,
      icon: Icon(Icons.arrow_back_ios),
      tooltip: 'Back',
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    return buildAppbar(context, title: title, leading: leading);
  }
}

class ListPosts extends StatelessWidget {
  final int categoryIndex;

  ListPosts(this.categoryIndex);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listLessons[categoryIndex].length,
        itemBuilder: (BuildContext context, int index) {
          return _rowItem(context, index);
        });
  }

  Widget _test(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
          child: Container(
            width: 60,
            height: 45,
            color: Colors.green,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
          child: Container(
            width: size.width - 80,
            height: 45,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _rowItem(BuildContext context, int index) {
    return Card(
//      color: darkMode ? kCardDarkColor : kCardColor,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
//        splashColor: darkMode ? kCardHighlightDarkColor : kCardHighlightColor,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostPage(categoryIndex, index)));
        },
        child: ListTile(
          leading: SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontFamily: 'Oswald'),
              ),
              backgroundColor: kPrimaryLightColor,
            ),
          ),
          title: Text(
            listLessons[categoryIndex][index].title,
            style: TextStyle(
                color: darkMode ? kTextDarkColor : kTextColor,
                fontSize: 17,
                fontFamily: 'Oswald'),
          ),
        ),
      ),
    );
  }
}
