import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/post/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPostsPage extends StatelessWidget {
  final int categoryIndex;

  ListPostsPage(this.categoryIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          title: Text(listCategories[categoryIndex].title,
              style: GoogleFonts.lobster(fontSize: 23)),
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      backgroundColor: darkMode ? kBackgroundDarkColor : kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(child: ListPosts(categoryIndex)),
        ],
      ),
    );
  }
}

class ListPosts extends StatelessWidget {
  final int categoryIndex;

  ListPosts(this.categoryIndex);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listPosts[categoryIndex].length,
        itemBuilder: (BuildContext context, int index) {
          return _rowItem(context, index);
        });
  }

  Widget _rowItem(BuildContext context, int index) {
    return Card(
      color: darkMode ? kCardDarkColor : kCardColor,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        splashColor: darkMode ? kCardHighlightDarkColor : kCardHighlightColor,
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
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: kPrimaryLightColor,
            ),
          ),
          title: Text(
            listPosts[categoryIndex][index].title,
            style: TextStyle(color: darkMode ? kTextDarkColor : kTextColor),
          ),
        ),
      ),
    );
  }
}
