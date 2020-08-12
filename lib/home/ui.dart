import 'package:coding_with_itmc/categories/ui.dart';
import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    List<Widget> listActions = [
      IconButton(
        icon: Icon(Icons.account_circle),
        tooltip: 'Account',
        onPressed: () {
          print('Account action pressed');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      )
    ];
    return buildAppbar(context, title: 'iTMC', actions: listActions);
  }

  _buildDrawer() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        elevation: 1.0,
        child: Container(
          color: darkMode ? kBackgroundDarkColor : kBackgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                child: UserAccountsDrawerHeader(
                  accountName: Text('Quang Vinhh'),
                  accountEmail: Text('vinhvipit@gmail.com'),
                  currentAccountPicture: FlatButton(
                    color: Colors.white,
                    child: Text('V', style: TextStyle(fontSize: 40, color: Colors.blue)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: (){
                      print('Account pressed');
                    },
                  )
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
