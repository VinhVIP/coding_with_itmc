import 'package:coding_with_itmc/categories/ui.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/login/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  _HomePage() {
    InitData initData = new InitData();
    initData.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? kBackgroundDarkColor : kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('iTMC',
              style: GoogleFonts.galada(fontSize: 23, letterSpacing: 2.5)),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              tooltip: 'Account',
              onPressed: () {
                print('Account action pressed');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(child: ListCategories()),
        ],
      ),
      drawer: _buildDrawer(),
    );
  }

  _buildDrawer() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        elevation: 1.0,
        child: Container(
          color: darkMode ? kBackgroundDarkColor : kBackgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Colors.blue[900],
                  child: Image.asset('assets/images/itmc.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                          color: darkMode ? kTextDarkColor : kTextColor),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Switch(
                      value: darkMode,
                      onChanged: (bool value) {
                        setState(() {
                          darkMode = value;
                          SharedPreferencesManager.saveDarkModeValue();
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListCategories extends StatelessWidget {
  ListCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listCategories.length,
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
          _moveToCategory(context, index);
        },
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              child: listCategories[index].icon,
              backgroundColor: Colors.blue[50],
            ),
          ),
          title: Text(
            listCategories[index].title,
            style: TextStyle(color: darkMode ? kTextDarkColor : kTextColor),
          ),
          subtitle: Text(
            listCategories[index].numPosts.toString() + " bài học",
            style: TextStyle(
                color:
                    darkMode ? kTextSecondaryDarkColor : kTextSecondaryColor),
          ),
        ),
      ),
    );
  }

  _moveToCategory(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListPostsPage(index),
      ),
    );
  }
}
