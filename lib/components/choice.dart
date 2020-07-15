import 'package:coding_with_itmc/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  String data;

  Choice(this.data);

  @override
  State<StatefulWidget> createState() {
    return _ChoiceState(data);
  }
}

class _ChoiceState extends State<Choice> with AutomaticKeepAliveClientMixin {
  String data;

  List<String> questions;
  List<List<String>> answers;
  List<List<int>> correct;

  _ChoiceState(this.data) {
    List<String> list = data.split('||');
    int size = list.length;
    questions = new List(size);
    answers = new List(size);
    correct = new List(size);

    int len;

    for (int q = 0; q < size; q++) {
      answers[q] = new List();
      correct[q] = new List();

      List<String> ques = list[q].split('|'); // 1 câu trắc nghiệm
      questions[q] = ques[0].trim(); // Thêm câu hỏi
      len = ques.length;

      // Thêm các phương án
      for (int a = 1; a < len - 1; a++) {
        answers[q].add(ques[a].trim());
      }

      // Thêm các đáp án đúng
      ques[len - 1] = ques[len - 1].trim();
      for (int c = 0; c < ques[len - 1].length; c++) {
        correct[q].add(int.tryParse(ques[len - 1][c]));
      }
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<Widget> widgets = new List(questions.length);
    for (int i = 0; i < widgets.length; i++) {
      widgets[i] = (correct[i].length >= 2)
          ? MultiChoice(questions[i], answers[i], correct[i])
          : SingleChoice(questions[i], answers[i], correct[i][0]);
    }
    return DefaultTabController(
      length: widgets.length,
      child: Builder(
        builder: (context) => Column(
          children: <Widget>[
            TabPageSelector(),
            Expanded(
              child: TabBarView(
                children: widgets,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleChoice extends StatefulWidget {
  String question;
  List<String> answers;
  int correct;

  SingleChoice(this.question, this.answers, this.correct);

  @override
  State<StatefulWidget> createState() {
    return new _SingleChoice(question, answers, correct);
  }
}

class _SingleChoice extends State<SingleChoice>
    with AutomaticKeepAliveClientMixin {
  String question;
  final List<String> answers;
  List<Widget> widgets;
  final int correct;
  int _radioValue = -1;

  String mess;
  Color messColor;

  _SingleChoice(this.question, this.answers, this.correct) {
    widgets = new List(answers.length);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    for (int i = 0; i < answers.length; i++) {
      widgets[i] = RadioListTile(
        title: Text(answers[i]),
        value: i,
        groupValue: _radioValue,
        onChanged: (value) {
          setState(() {
            _radioValue = value;
            mess = null;
          });
        },
      );
    }

    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                question,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Column(
              children: widgets,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                mess == null ? '' : mess,
                style: TextStyle(
                    color: messColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: RaisedButton(
                color: kPrimaryLightColor,
                textColor: Colors.white,
                onPressed: () {
                  _checkResult();
                },
                child: Text('Kiểm tra'),
              ),
            ),
          ]),
    );
  }

  _checkResult() {
    setState(() {
      if (_radioValue == correct) {
        messColor = Colors.green;
        mess = 'Đáp án chính xác';
      } else {
        messColor = Colors.red;
        mess = 'Đáp án không chính xác';
      }
    });
  }
}

class MultiChoice extends StatefulWidget {
  String question;
  List<String> answers;
  List<int> correct;

  MultiChoice(this.question, this.answers, this.correct);

  @override
  State<StatefulWidget> createState() {
    return _MultiChoiceState(question, answers, correct);
  }
}

class _MultiChoiceState extends State<MultiChoice>
    with AutomaticKeepAliveClientMixin {
  String question;
  final List<String> answers;
  List<Widget> widgets;
  List<bool> correct;
  List<bool> _cbValue;
  String mess;
  Color messColor;

  _MultiChoiceState(this.question, this.answers, List<int> intCorrect) {
    widgets = new List(answers.length);
    _cbValue = new List.filled(answers.length, false);
    correct = new List.filled(answers.length, false);
    for (int i = 0; i < intCorrect.length; i++) {
      correct[intCorrect[i]] = true;
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    for (int i = 0; i < answers.length; i++) {
      widgets[i] = ListTile(
        title: Text(
          answers[i],
          style: TextStyle(fontSize: 15),
        ),
        leading: Checkbox(
          value: _cbValue[i],
          onChanged: (bool value) {
            setState(() {
              _cbValue[i] = value;
              mess = null;
            });
          },
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(question),
            ),
            Column(
              children: widgets,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                mess == null ? '' : mess,
                style: TextStyle(
                    color: messColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: RaisedButton(
                color: kPrimaryLightColor,
                textColor: Colors.white,
                onPressed: () {
                  _checkResult();
                },
                child: Text('Kiểm tra'),
              ),
            ),
          ]),
    );
  }

  _checkResult() {
    setState(() {
      for (int i = 0; i < _cbValue.length; i++) {
        if (_cbValue[i] != correct[i]) {
          messColor = Colors.red;
          mess = 'Đáp án không chính xác';
          return;
        }
      }
      messColor = Colors.green;
      mess = 'Đáp án chính xác';
    });
  }
}
