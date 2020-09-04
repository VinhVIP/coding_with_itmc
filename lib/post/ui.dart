import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/choice.dart';
import 'package:coding_with_itmc/components/mark_down.dart';
import 'package:coding_with_itmc/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostPage extends StatefulWidget {
  final int categoryIndex, postIndex;

  PostPage(this.categoryIndex, this.postIndex);

  @override
  State<StatefulWidget> createState() {
    return new _PostPageState(categoryIndex, postIndex);
  }
}

class _PostPageState extends State<PostPage> {
  final int categoryIndex, postIndex;
  List<Widget> _kTabPages = new List(2);
  int _currentTabIndex = 0;

  _PostPageState(this.categoryIndex, this.postIndex) {
    initData();
  }

  void initData() {
    _kTabPages[0] = PageLesson(
      key: PageStorageKey('PageLesson'),
      categoryIndex: categoryIndex,
      postIndex: postIndex,
    );
    _kTabPages[1] = PageChoice(
      key: PageStorageKey('PageChoice'),
      courseID: categoryIndex,
      postIndex: postIndex,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? kBackgroundDarkColor : kCardColor,
      appBar: _buildAppBar(context, listLessons[categoryIndex][postIndex].title),
      body: IndexedStack(
        index: _currentTabIndex,
        children: _kTabPages,
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAppBar(BuildContext context, String title) {
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

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: darkMode ? kCardDarkColor : kCardColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.library_books,
          ),
          title: Text('Lý thuyết', style: TextStyle(fontFamily: 'Oswald'),),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.check_circle,
          ),
          title: Text('Trắc nghiệm', style: TextStyle(fontFamily: 'Oswald')),
        ),
      ],
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: darkMode ? Colors.white : kPrimaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
  }
}

class PageLesson extends StatelessWidget {
  final int categoryIndex, postIndex;

  const PageLesson({Key key, this.categoryIndex, this.postIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getFileContent(listLessons[categoryIndex][postIndex].pathLesson),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: buildMarkdown(context, snapshot.data),
            );
          }
          return Center(
            child: Text(
              'Bài viết hiện chưa được cập nhật',
              style: TextStyle(color: darkMode ? kTextDarkColor : kTextColor),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<String> getFileContent(String path) async {
    return await rootBundle.loadString(path);
  }
}

class PageChoice extends StatelessWidget {
  final int courseID, postIndex;

  PageChoice({Key key, this.courseID, this.postIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future:
          getFileChoiceContent(listLessons[courseID][postIndex].pathChoice),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Choice(snapshot.data);
          }
          return Center(
            child: Text(
              'Không có câu hỏi trắc nghiệm!',
              style: TextStyle(color: darkMode ? kTextDarkColor : kTextColor),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<String> getFileChoiceContent(String path) async {
    return await rootBundle.loadString(path);
  }
}
