import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  String data;

  List<String> answers = new List();
  String question;
  List<int> correct = new List();

  Choice(this.data) {
    List<String> list = data.split('|');
    int size = list.length;

    assert(size >= 4);
    question = list[0].trim();
    for (int i = 1; i < size - 1; i++) {
      answers.add(list[i].trim());
    }

    list[size - 1] = list[size - 1].trim();
    assert(list[size - 1].length > 0);
    for (int i = 0; i < list[size - 1].length; i++) {
      correct.add(int.tryParse(list[size - 1][i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = (correct.length >= 2)
        ? MultiChoice(answers, correct)
        : SingleChoice(answers, correct[0]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(question),
        widget,
      ],
    );
  }
}

class SingleChoice extends StatefulWidget {
  List<String> answers;
  int correct;

  SingleChoice(this.answers, this.correct);

  @override
  State<StatefulWidget> createState() {
    return new _SingleChoice(answers, correct);
  }
}

class _SingleChoice extends State<SingleChoice> {
  final List<String> answers;
  List<RadioListTile> widgets = new List();
  final int correct;
  int _radioValue = -1;

  _SingleChoice(this.answers, this.correct) {
    for (int i = 0; i < answers.length; i++) {
      widgets.add(RadioListTile(
        title: Text(answers[i]),
        value: i,
        groupValue: _radioValue,
        onChanged: (value){
          print('click $value, radioValue $_radioValue');
          setState(() {
            _radioValue = value;
          });
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }

//  void _handleRadioValueChange(int value) {
//    print('click $value, radioValue $_radioValue');
//    setState(() {
//      _radioValue = value;
//    });
//  }
}

class MultiChoice extends StatefulWidget {
  List<String> answers;
  List<int> correct;

  MultiChoice(this.answers, this.correct);

  @override
  State<StatefulWidget> createState() {
    return _MultiChoiceState(answers, correct);
  }
}

class _MultiChoiceState extends State<MultiChoice> {
  final List<String> answers;
  List<Widget> widgets = new List();
  List<int> correct;
  List<bool> _cbValue = new List();

  _MultiChoiceState(this.answers, this.correct) {
    for (int i = 0; i < answers.length; i++) {
      _cbValue.add(false);
      widgets.add(ListTile(
        title: Text(answers[i]),
        leading: Checkbox(
          value: _cbValue[i],
          onChanged: (bool value) {
            _handleCheckBoxValueChange(value, i);
          },
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }

  _handleCheckBoxValueChange(bool value, int index) {
    setState(() {
      _cbValue[index] = value;
    });
  }
}
