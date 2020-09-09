import 'dart:ui';

import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/list_courses.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/login/login_ui.dart';
import 'package:coding_with_itmc/models/theme.dart';
import 'package:coding_with_itmc/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Widget _mainWidget(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'iTMC'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: Text(
                'Nhập môn lập trình',
                style: TextStyle(
                    color: darkMode ? Colors.indigoAccent : Colors.indigo, fontSize: 22, fontFamily: 'Oswald'),
              ),
            ),
            Container(
              height: 260,
              child: ListCourses(
                courses: listCoursesBasic,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 10, bottom: 5),
              child: Text(
                'Lập trình Web',
                style: TextStyle(
                    color: darkMode ? Colors.indigoAccent : Colors.indigo, fontSize: 22, fontFamily: 'Oswald'),
              ),
            ),
            Container(
              height: 260,
              child: ListCourses(
                courses: listCoursesWeb,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 10, bottom: 5),
              child: Text(
                'Lập trình Mobile',
                style: TextStyle(
                    color: darkMode ? Colors.indigoAccent : Colors.indigo, fontSize: 22, fontFamily: 'Oswald'),
              ),
            ),
            Container(
              height: 260,
              child: ListCourses(
                courses: listCoursesMobile,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      drawer: _buildDrawer(),
    );
  }

  _buildAppBar(BuildContext context, String title) {
    return buildAppbar(context, title: 'iTMC');
  }

  _gotoProfilePage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
    setState(() {});
  }

  _buildDrawer() {
    var drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      accountName: Text(
        "${user.firstName} ${user.lastName}",
        style: TextStyle(
            fontFamily: 'Oswald', fontWeight: FontWeight.bold, fontSize: 17),
      ),
      accountEmail: Text("${user.email}",
          style: TextStyle(fontFamily: 'Oswald', fontSize: 16)),
      currentAccountPicture: InkWell(
        onTap: () {
          _gotoProfilePage();
        },
        child: Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/avatar.jpg',
              ),
            ),
          ),
        ),
      ),
    );

    var drawerItems = ListView(
      children: <Widget>[
        InkWell(
            onTap: () {
              _gotoProfilePage();
            },
            child: drawerHeader,
        ),
        InkWell(
          onTap: () {
            setState(() {
              darkMode = !darkMode;
              SharedPreferencesManager.saveDarkModeValue();
            });
          },
          child: Container(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Consumer<MyTheme>(
                builder: (context, theme, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.brightness_6,
                          color: kPrimaryColor,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 17,
                            color: darkMode ? kTextDarkColor : kTextColor,
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
                          theme.changeTheme();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            print('fanpage itmc');
            _launchURL("https://www.facebook.com/it.multimedia.club");
          },
          child: Container(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/images/icon_fb.png', width: 23, height: 23,),
                  SizedBox(width: 15),
                  Text(
                    'Fanpage CLB iTMC',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 17,
                      color: darkMode ? kTextDarkColor : kTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            print('link');
            _launchURL("mailto:vinhvipvl@gmail.com?subject=Alo&body=Hihi");
          },
          child: Container(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Liên hệ',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 17,
                      color: darkMode ? kTextDarkColor : kTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          child: Container(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/images/icon_logout.png', width: 22, height: 22,),
                  SizedBox(width: 15),
                  Text(
                    'Đăng xuất',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 17,
                      color: darkMode ? kTextDarkColor : kTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            SharedPreferencesManager.saveUserLogged(false, '', '');
            userLogin.isLogged = false;

            Navigator.of(context).pop();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
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

  _launchURL(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }else{
      print('no no');
    }

  }

}
