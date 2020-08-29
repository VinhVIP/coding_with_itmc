import 'dart:ui';

import 'package:coding_with_itmc/categories/ui.dart';
import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/login/login_ui.dart';
import 'package:coding_with_itmc/models/theme.dart';
import 'package:coding_with_itmc/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyTheme(),
      child: Consumer<MyTheme>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          home: _mainWidget(context),
        ),
      ),
    );
    
    
  }
  
  Widget _mainWidget(BuildContext context){
    return Scaffold(
//      backgroundColor: Theme.of(context).backgroundColor,
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
    return buildAppbar(context, title: 'iTMC');
  }

  _buildDrawer() {
    var drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      accountName: Text(
        user.firstName + " " + user.lastName,
        style: TextStyle(
            fontFamily: 'Oswald', fontWeight: FontWeight.bold, fontSize: 17),
      ),
      accountEmail: Text(user.email,
          style: TextStyle(fontFamily: 'Oswald', fontSize: 16)),
      currentAccountPicture: FlatButton(
        color: Colors.white,
        child: Text(user.lastName.substring(0, 1).toUpperCase(),
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
            Consumer<MyTheme>(
              builder: (context, theme, child) => Switch(
                value: darkMode,
                onChanged: (bool value) {
                  setState(() {
                    darkMode = value;
                    SharedPreferencesManager.saveDarkModeValue();
                    theme.changeTheme();
                  });
                },
              ),
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
            SharedPreferencesManager.saveUserLogged(false, '', '');
            userLogin.isLogged = false;

//            Navigator.of(context).pop();
//            Navigator.pushAndRemoveUntil(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => LoginPage(),
//                ),
//                (_) => false).then((value) {
//              setState(() {});
//            });
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
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
    var size = MediaQuery.of(context).size.width;

    return Card(
//      color: darkMode ? kCardDarkColor : kCardColor,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
//        splashColor: darkMode ? kCardHighlightDarkColor : kCardHighlightColor,
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
