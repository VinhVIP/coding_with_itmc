import 'dart:convert';
import 'dart:ui';

import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/models/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _firstNameController,
      _lastNameController,
      _studentIDController,
      _schoolController;

  String _dateOfBirth;

  bool _firstNameIsValid, _lastNameIsValid, _studentIDIsValid, _schoolIsValid;

  bool _viewProfile = true;
  int _radioGenderValue;

  @override
  void initState() {
    _dateOfBirth = user.dateOfBirth;
    _radioGenderValue = user.gender;
    _viewProfile = true;
    _firstNameIsValid =
        _lastNameIsValid = _studentIDIsValid = _schoolIsValid = true;

    _firstNameController = TextEditingController(text: user.firstName);
    _lastNameController = TextEditingController(text: user.lastName);
    _studentIDController = TextEditingController(text: user.studentID);
    _schoolController = TextEditingController(text: user.school);

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _studentIDController.dispose();
    _schoolController.dispose();
    super.dispose();
  }

  bool _checkFirstNameIsValid(String value) {
    return value != null && value.trim().length > 0;
  }

  bool _checkLastNameIsValid(String value) {
    return value != null && value.trim().length > 0;
  }

  bool _checkStudentIDIsValid(String value) {
    return value != null && value.trim().length > 0;
  }

  String convertDateOfBirth(String date) {
    if (date != null && date.length > 0) {
      List<String> s = date.split("/");
      assert(s.length == 3);
      return s[2] + "-" + s[0] + "-" + s[1];
    }
    return null;
  }

  bool _checkSchoolsValid(String value) {
    return value != null && value.trim().length > 0;
  }

  _handleRadioGenderValueChange(int value) {
    setState(() {
      _radioGenderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widgetView = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 150,
          child: Column(
            children: <Widget>[
              SizedBox(height: 2),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.chevron_right,
                    color: Colors.blue,
                    size: 25,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Giới tính :',
                    style: TextStyle(
                        fontSize: 18, fontFamily: 'Oswald', color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.chevron_right,
                    color: Colors.blue,
                    size: 25,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Ngày sinh :',
                    style: TextStyle(
                        fontSize: 18, fontFamily: 'Oswald', color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.chevron_right,
                    color: Colors.blue,
                    size: 25,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Mã sinh viên :',
                    style: TextStyle(
                        fontSize: 18, fontFamily: 'Oswald', color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.chevron_right,
                    color: Colors.blue,
                    size: 25,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Trường học :',
                    style: TextStyle(
                        fontSize: 18, fontFamily: 'Oswald', color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 2),
//                      Text('${user.firstName} ${user.lastName}', style: TextStyle(fontSize: 17)),
//                      SizedBox(height: 15),
            Text(
                user.gender == 0
                    ? 'Nam'
                    : (user.gender == 1 ? 'Nữ' : 'Không rõ'),
                style: TextStyle(fontSize: 18, fontFamily: 'Oswald')),
            SizedBox(height: 20),
            Text('${user.dateOfBirth ?? 'Chưa cập nhật'}',
                style: TextStyle(fontSize: 18, fontFamily: 'Oswald')),
            SizedBox(height: 20),
            Text('${user.studentID ?? 'Chưa cập nhật'}',
                style: TextStyle(fontSize: 18, fontFamily: 'Oswald')),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width - 170,
              child: Text(
                '${user.school ?? 'Chưa cập nhật'}',
                style: TextStyle(fontSize: 18, fontFamily: 'Oswald'),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ],
    );

    var widgetEdit = Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Họ và tên đệm',
              errorText: _firstNameIsValid
                  ? null
                  : 'Họ và tên đệm không được bỏ trống',
            ),
            onChanged: (value) {
              if (_firstNameIsValid != _checkFirstNameIsValid(value)) {
                setState(() {
                  _firstNameIsValid = !_firstNameIsValid;
                });
              }
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => context.nextEditableTextFocus(),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Tên',
              errorText:
                  _lastNameIsValid ? null : 'Tên đệm không được bỏ trống',
            ),
            onChanged: (value) {
              if (_lastNameIsValid != _checkLastNameIsValid(value)) {
                setState(() {
                  _lastNameIsValid = !_lastNameIsValid;
                });
              }
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => context.nextEditableTextFocus(),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Giới tính: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Wrap(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioGenderValue,
                    onChanged: _handleRadioGenderValueChange,
                  ),
                  Text('Nam'),
                  SizedBox(width: 20),
                  Radio(
                    value: 1,
                    groupValue: _radioGenderValue,
                    onChanged: _handleRadioGenderValueChange,
                  ),
                  Text('Nữ'),
                  SizedBox(width: 20),
                  Radio(
                    value: 2,
                    groupValue: _radioGenderValue,
                    onChanged: _handleRadioGenderValueChange,
                  ),
                  Text('Không rõ'),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 4),
              Text(
                'Ngày sinh:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 20),
              Container(
                width: 100,
                child: Text(
                  '$_dateOfBirth',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              FlatButton(
                child: Icon(
                  Icons.date_range,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.utc(2000, 1, 1),
                          firstDate: DateTime(1980),
                          lastDate: DateTime.now())
                      .then((value) {
                    if (value != null) {
                      print('Date selected: $value');

                      setState(() {
                        _dateOfBirth = (value.day < 10 ? '0' : '') +
                            value.day.toString() +
                            '/' +
                            (value.month < 10 ? '0' : '') +
                            value.month.toString() +
                            '/' +
                            value.year.toString();
                      });
                    }
                  });
                },
              )
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _studentIDController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mã sinh viên',
              errorText:
                  _studentIDIsValid ? null : 'Mã sinh viên không được bỏ trống',
            ),
            onChanged: (value) {
              if (_studentIDIsValid != _checkStudentIDIsValid(value)) {
                setState(() {
                  _studentIDIsValid = !_studentIDIsValid;
                });
              }
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => context.nextEditableTextFocus(),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _schoolController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Trường',
              errorText: _schoolIsValid ? null : 'Trường không được bỏ trống',
            ),
            onChanged: (value) {
              if (_schoolIsValid != _checkSchoolsValid(value)) {
                setState(() {
                  _schoolIsValid = !_schoolIsValid;
                });
              }
            },
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
          ),
          SizedBox(height: 30),
          RoundedButton(
            text: 'Chỉnh sửa',
            textColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            borderColor: Colors.white,
            onPressed: () {
              _updateProfile();
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );

    return Scaffold(
      appBar: _buildAppbar(context, 'Profile'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                child: Text(
                  '</>',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                backgroundColor: Colors.blue,
              ),
              SizedBox(height: 10),
              Center(
                  child: Text(
                '${user.firstName ?? 'Không biết'} ${user.lastName ?? ''}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              )),
              SizedBox(height: 5),
              Center(
                  child: Text(
                '${user.email ?? 'Chưa cập nhật'}',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              )),
              SizedBox(height: 30),
              _viewProfile ? widgetView : widgetEdit,
            ],
          ),
        ),
      ),
    );
  }

  _buildAppbar(BuildContext context, String title) {
    Widget leading = IconButton(
      color: Colors.white,
      icon: Icon(Icons.arrow_back_ios),
      tooltip: 'Back',
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    List<Widget> listActions = [
      _viewProfile
          ? Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  tooltip: 'Chỉnh sửa',
                  onPressed: () {
                    print('Edit profile');
                    setState(() {
                      _viewProfile = false;
                    });
                  },
                ),
                SizedBox(width: 10)
              ],
            )
          : FlatButton(
              child: Text(
                'HỦY',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  _viewProfile = true;
                });
              },
            )
    ];
    return buildAppbar(context,
        title: title, leading: leading, actions: listActions);
  }

  _updateProfile() {
    setState(() {
      if (_studentIDController.text == null ||
          _studentIDController.text.trim().length == 0)
        _studentIDIsValid = false;
      if (_schoolController.text == null ||
          _schoolController.text.trim().length == 0) _schoolIsValid = false;
      if (_firstNameController.text == null ||
          _firstNameController.text.trim().length == 0)
        _firstNameIsValid = false;
      if (_lastNameController.text == null ||
          _lastNameController.text.trim().length == 0) _lastNameIsValid = false;
    });
    bool isValid = _studentIDIsValid &&
        _schoolIsValid &&
        _firstNameIsValid &&
        _lastNameIsValid;
    if (isValid) {
      _firstNameController.text =
          _firstNameController.text.replaceAll(RegExp(' +'), ' ').trim();
      _lastNameController.text =
          _lastNameController.text.replaceAll(RegExp(' +'), ' ').trim();
      _studentIDController.text =
          _studentIDController.text.replaceAll(RegExp(' '), '');
      _schoolController.text =
          _schoolController.text.replaceAll(RegExp(' +'), ' ').trim();
      _showDialogUpdateProfile(context);
    }
  }

  Future<void> _showDialogUpdateProfile(BuildContext context) async {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Center(
              child: Text(
            'Cập nhật',
            style: TextStyle(color: Colors.indigo, fontSize: 22),
          )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FutureBuilder<Notify>(
                future: _requestUpdateProfile(
                    _firstNameController.text,
                    _lastNameController.text,
                    _radioGenderValue == 0
                        ? 'male'
                        : (_radioGenderValue == 1 ? 'female' : 'other'),
                    _dateOfBirth,
                    _studentIDController.text.trim(),
                    _schoolController.text.trim(),
                    'http://icon.gg'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Notify notify = snapshot.data;

                    return Column(
                      children: <Widget>[
                        Text(notify.message),
                        SizedBox(height: 10),
                        FlatButton(
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop('OK');
                          },
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value.compareTo('OK') == 0) {
        setState(() {
          _viewProfile = true;
        });
      }
    });
  }

  Future<Notify> _requestUpdateProfile(
      String firstName,
      String lastName,
      String gender,
      String dateOfBirth,
      String studentID,
      String school,
      String gravatar) async {
    try {
      final http.Response response = await http.post(
        urlUserProfile,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'firstName': firstName,
          'lastName': lastName,
          'gender': gender,
          'dateOfBirth': dateOfBirth,
          'studentID': studentID,
          'school': school,
          'gravatar': gravatar,
        }),
      );

      if (response.statusCode == 200) {
        user.convert(json.decode(response.body)['data']);
        print('Updated successfully');
        return Notify(response.statusCode, 'Cập nhật thành công!');
      } else if (response.statusCode == 400) {
        String mess = "";
        var list = json.decode(response.body)['error']['descriptions'];
        for (String s in list) {
          mess += s + "\n";
        }
        return Notify(response.statusCode, mess);
      } else if (response.statusCode == 401) {
        return Notify(response.statusCode, 'Unauthorized');
      } else {
        return Notify(response.statusCode, 'Có lỗi xảy ra');
      }
    } catch (e) {
      print('error: $e');
      return Notify(-1, 'Có lỗi xảy ra!');
    }
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild.context.widget is! EditableText);
  }
}
