import 'dart:ui';

import 'package:coding_with_itmc/categories/ui.dart';
import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/login/login_view.dart';
import 'package:coding_with_itmc/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../config.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  HomePageState() {
    InitData initData = new InitData();
    initData.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? kBackgroundDarkColor : kBackgroundColor,
      appBar: _buildAppBar(context, 'iTMC'),
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

  _buildAppBar(BuildContext context, String title) {
//    List<Widget> listActions = [
//      IconButton(
//        icon: Icon(Icons.account_circle),
//        tooltip: 'Account',
//        onPressed: () {
//          print('Account action pressed');
//          Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => LoginScreen()))
//              .then((value) {
//            setState(() {});
//          });
//        },
//      )
//    ];
    return buildAppbar(context, title: 'iTMC');
  }

  _buildDrawer() {
    var drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      accountName: Text(
        user.login ? user.firstName + " " + user.lastName : "Trần Quang Vinh",
        style: TextStyle(
            fontFamily: 'Oswald', fontWeight: FontWeight.bold, fontSize: 17),
      ),
      accountEmail: Text(user.login ? user.email : 'vinh@gmail.com',
          style: TextStyle(fontFamily: 'Oswald', fontSize: 16)),
      currentAccountPicture: FlatButton(
        color: Colors.white,
        child: Text(
            user.login ? user.lastName.substring(0, 1).toUpperCase() : 'A',
            style: TextStyle(fontSize: 40, color: Colors.blue)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {
          print('Account pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
      ),
    );

    var drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.brightness_6,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 17,
//                    color: darkMode ? kTextDarkColor : kTextColor,
                  ),
                ),
              ],
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
        InkWell(
          splashColor: Colors.red,
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.timer_off),
                SizedBox(width: 10),
                Text(
                  'Đăng xuất',
                  style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 17,
//                      color: darkMode ? kTextDarkColor : kTextColor,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (_) => false).then((value) {
              setState(() {});
            });
          },
        ),
      ],
    );

    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        elevation: 1.0,
        child: Container(
//          color: darkMode ? kBackgroundDarkColor : kBackgroundColor,
          child: drawerItems,
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
            style: TextStyle(
                color: darkMode ? kTextDarkColor : kTextColor,
                fontSize: 18,
                fontFamily: 'Oswald'),
          ),
          subtitle: Text(
            listCategories[index].numPosts.toString() + " bài học",
            style: TextStyle(
                color: darkMode ? kTextSecondaryDarkColor : kTextSecondaryColor,
                fontSize: 14,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w200),
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
