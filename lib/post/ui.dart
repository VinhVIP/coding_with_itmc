import 'package:coding_with_itmc/components/choice.dart';
import 'package:coding_with_itmc/components/mark_down.dart';
import 'package:coding_with_itmc/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
      categoryIndex: categoryIndex,
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
      backgroundColor: darkMode ? kBackgroundDarkColor : kBackgroundColor,
      appBar: _buildAppBar(context),
      body: IndexedStack(
        index: _currentTabIndex,
        children: _kTabPages,
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: Text(listPosts[categoryIndex][postIndex].title,
            style: GoogleFonts.lobster(fontSize: 20)),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: darkMode ? kCardDarkColor : kBackgroundColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.library_books,
            color: kTabActiveDarkColor,
          ),
          icon: Icon(
            Icons.library_books,
            color: darkMode ? kTabDarkColor : kTabColor,
          ),
          title: Text(
            'Lý thuyết',
            style: TextStyle(color: darkMode ? kTabDarkColor : kTabColor),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.check_circle,
            color: kTabActiveDarkColor,
          ),
          icon: Icon(
            Icons.check_circle,
            color: darkMode ? kTabDarkColor : kTabColor,
          ),
          title: Text(
            'Trắc nghiệm',
            style: TextStyle(color: darkMode ? kTabDarkColor : kTabColor),
          ),
        ),
      ],
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
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
      future: getFileContent(listPosts[categoryIndex][postIndex].pathLesson),
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
  final int categoryIndex, postIndex;

  PageChoice({Key key, this.categoryIndex, this.postIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future:
          getFileChoiceContent(listPosts[categoryIndex][postIndex].pathChoice),
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
