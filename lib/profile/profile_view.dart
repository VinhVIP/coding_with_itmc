import 'dart:ui';

import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/dialog.dart';
import 'package:coding_with_itmc/components/input_decoration.dart';
import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/models/user.dart';
import 'package:coding_with_itmc/profile/profile_bloc.dart';
import 'package:coding_with_itmc/profile/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _firstNameController,
      _lastNameController,
      _studentIDController,
      _schoolController;

  @override
  void initState() {
    _firstNameController = TextEditingController(text: user.firstName);
    _lastNameController = TextEditingController(text: user.lastName);
    _studentIDController = TextEditingController(text: user.studentID);
    _schoolController = TextEditingController(text: user.school);

    final provider = Provider.of<ProfileBloc>(context, listen: false);

    _firstNameController.addListener(() {
      provider.firstName = _firstNameController.text.trim();
      provider.firstNameSink.add(_firstNameController.text);
    });

    _lastNameController.addListener(() {
      provider.lastName = _lastNameController.text.trim();
      provider.lastNameSink.add(_lastNameController.text);
    });

    _studentIDController.addListener(() {
      provider.schoolSink.add(_studentIDController.text);
    });

    _schoolController.addListener(() {
      provider.schoolSink.add(_schoolController.text);
    });

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

  @override
  Widget build(BuildContext context) {
    print('rebuild all');
    final profileBloc = Provider.of<ProfileBloc>(context, listen: false);

    return Scaffold(
      appBar: _buildAppbar(context, 'Profile', profileBloc),
      backgroundColor: darkMode ? kBackgroundDarkColor : kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
          child: Consumer<ProfileBloc>(
            builder: (context, model, child) {
              return model.viewProfile
                  ? profileViewer()
                  : profileEditor(profileBloc);
            },
          ),
        ),
      ),
    );
  }

  _buildAppbar(BuildContext context, String title, ProfileBloc profileBloc) {
    print('rebuild appbar');

    Widget leading = IconButton(
      color: Colors.white,
      icon: Icon(Icons.arrow_back_ios),
      tooltip: 'Back',
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    List<Widget> listActions = [
      Consumer<ProfileBloc>(
        builder: (context, model, child) {
          if (model.viewProfile) {
            return Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  tooltip: 'Chỉnh sửa',
                  onPressed: () {
                    profileBloc.viewProfile = false;
                  },
                ),
                SizedBox(width: 10)
              ],
            );
          } else {
            return FlatButton(
              child: Text(
                'HỦY',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                profileBloc.viewProfile = true;
              },
            );
          }
        },
      ),
    ];
    return buildAppbar(context,
        title: title, leading: leading, actions: listActions);
  }

  Widget profileViewer() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        _buildCircleAvatar(),
        SizedBox(height: 10),
        _buildFullName(),
        SizedBox(height: 5),
        _buildEmail(),
        SizedBox(height: 30),
        Row(
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
                            fontSize: 18,
                            fontFamily: 'Oswald',
                            color: Colors.blue),
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
                            fontSize: 18,
                            fontFamily: 'Oswald',
                            color: Colors.blue),
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
                            fontSize: 18,
                            fontFamily: 'Oswald',
                            color: Colors.blue),
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
                            fontSize: 18,
                            fontFamily: 'Oswald',
                            color: Colors.blue),
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
                Text(
                    user.gender == 0
                        ? 'Nam'
                        : (user.gender == 1 ? 'Nữ' : 'Không rõ'),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Oswald',
                      color: darkMode ? kTextDarkColor : kTextColor,
                    )),
                SizedBox(height: 20),
                Text('${user.dateOfBirth ?? 'Chưa cập nhật'}',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Oswald',
                      color: darkMode ? kTextDarkColor : kTextColor,
                    )),
                SizedBox(height: 20),
                Text('${user.studentID ?? 'Chưa cập nhật'}',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Oswald',
                      color: darkMode ? kTextDarkColor : kTextColor,
                    )),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width - 170,
                  child: Text(
                    '${user.school ?? 'Chưa cập nhật'}',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Oswald',
                      color: darkMode ? kTextDarkColor : kTextColor,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget profileEditor(ProfileBloc profileBloc) {
    profileBloc.firstNameSink.add(_firstNameController.text);
    profileBloc.lastNameSink.add(_lastNameController.text);
    profileBloc.studentIDSink.add(_studentIDController.text);
    profileBloc.schoolSink.add(_schoolController.text);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          _buildCircleAvatar(),
          SizedBox(height: 10),
          _buildFullName(),
          SizedBox(height: 5),
          _buildEmail(),
          SizedBox(height: 30),
          _buildFirstNameInput(profileBloc.firstNameStream),
          SizedBox(height: 20),
          _buildLastNameInput(profileBloc.lastNameStream),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Giới tính: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: darkMode ? kTextDarkColor : kTextColor,
              ),
            ),
          ),
          _buildGenderSelect(),
          _buildDateOfBirthSelect(context, profileBloc),
          SizedBox(height: 20),
          _buildStudentIDInput(profileBloc.studentIDStream),
          SizedBox(height: 20),
          _buildSchoolInput(profileBloc.schoolStream),
          SizedBox(height: 30),
          _buildButtonUpdateProfile(profileBloc),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  _showDialog(ProfileBloc profileBloc) async {
    showDialogLoading(context, 'Cập nhật');

    _firstNameController.text = _firstNameController.text.trim();
    _lastNameController.text = _lastNameController.text.trim();
    _studentIDController.text =
        _studentIDController.text.replaceAll(RegExp(' +'), '').trim();
    _schoolController.text =
        _schoolController.text.replaceAll(RegExp('  '), ' ').trim();

    final updateResult = await ProfileModel().requestUpdateProfile(
        _firstNameController.text,
        _lastNameController.text,
        profileBloc.radioGenderValue == 0
            ? 'male'
            : (profileBloc.radioGenderValue == 1 ? 'female' : 'other'),
        profileBloc.dateOfBirth,
        _studentIDController.text,
        _schoolController.text,
        'http://icon.gg');
    Navigator.pop(context, true);

    if (updateResult.code == 200) {
      user = new User.copy(
          user.email,
          user.pass,
          _firstNameController.text,
          _lastNameController.text,
          profileBloc.dateOfBirth,
          profileBloc.radioGenderValue,
          _studentIDController.text,
          _schoolController.text,
          user.gravatar);
      Function press = () {
        Navigator.pop(context, true);
        profileBloc.viewProfile = true;
        print('view');
      };
      showDialogNotification(context, 'Cập nhật', updateResult, press: press);
    } else {
      showDialogNotification(context, 'Cập nhật', updateResult);
    }
  }

  _buildCircleAvatar() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/images/avatar.jpg',
          ),
        ),
      ),
    );
  }

  _buildFullName() {
    return Center(
      child: Consumer<ProfileBloc>(
        builder: (context, model, child) {
          return Text(
            '${model.firstName} ${model.lastName}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: darkMode ? kTextDarkColor : kTextColor,
              fontFamily: 'Oswald',
            ),
          );
        },
      ),
    );
  }

  _buildEmail() {
    return Center(
        child: Text(
      '${user.email ?? 'Chưa cập nhật'}',
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 15,
        color: darkMode ? kTextDarkColor : kTextColor,
      ),
    ));
  }

  _buildFirstNameInput(firstNameStream) {
    return StreamBuilder<String>(
      stream: firstNameStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: _firstNameController,
          decoration: customInputBorder(
              labelText: 'Họ và tên đệm',
              hintText: 'Ví dụ: Nguyễn Văn',
              errorText: snapshot.data),
          style: TextStyle(
            color: darkMode ? kTextDarkColor : kTextColor,
          ),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => context.nextEditableTextFocus(),
        );
      },
    );
  }

  _buildLastNameInput(lastNameStream) {
    return StreamBuilder<String>(
      stream: lastNameStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: _lastNameController,
          decoration: customInputBorder(
              labelText: 'Tên',
              hintText: 'Ví dụ: An',
              errorText: snapshot.data),
          style: TextStyle(
            color: darkMode ? kTextDarkColor : kTextColor,
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        );
      },
    );
  }

  _buildStudentIDInput(studentIDStream) {
    return StreamBuilder<String>(
      stream: studentIDStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: _studentIDController,
          decoration: customInputBorder(
              labelText: 'Mã sinh viên',
              hintText: 'Ví dụ: N18DCCN246',
              errorText: snapshot.data),
          style: TextStyle(
            color: darkMode ? kTextDarkColor : kTextColor,
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        );
      },
    );
  }

  _buildSchoolInput(schoolStream) {
    return StreamBuilder<String>(
      stream: schoolStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: _schoolController,
          decoration: customInputBorder(
              labelText: 'Trường',
              hintText: 'Ví dụ: Học viện Công nghệ Bưu chính Viễn Thông',
              errorText: snapshot.data),
          style: TextStyle(
            color: darkMode ? kTextDarkColor : kTextColor,
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        );
      },
    );
  }

  _buildDateOfBirthSelect(BuildContext context, ProfileBloc profileBloc) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            'Ngày sinh:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: darkMode ? kTextDarkColor : kTextColor,
            ),
          ),
        ),
        Consumer<ProfileBloc>(
          builder: (context, model, child) {
            return Text(
              '${model.dateOfBirth}',
              style: TextStyle(
                fontSize: 16,
                color: darkMode ? kTextDarkColor : kTextColor,
              ),
            );
          },
        ),
        FlatButton(
          child: Icon(
            Icons.date_range,
            color: Colors.blue,
            size: 30,
          ),
          onPressed: () {
            List<String> date = profileBloc.dateOfBirth.split('/');

            showDatePicker(
                    context: context,
                    initialDate: DateTime.utc(
                        int.tryParse(date[2]),
                        int.parse(date[1]),
                        int.tryParse(date[0])), // yyyy-mm-dd
                    firstDate: DateTime(1980),
                    lastDate: DateTime.now())
                .then((value) {
              if (value != null) {
                print('Date selected: $value');

                profileBloc.dateOfBirth = (value.day < 10 ? '0' : '') +
                    value.day.toString() +
                    '/' +
                    (value.month < 10 ? '0' : '') +
                    value.month.toString() +
                    '/' +
                    value.year.toString();
              }
            });
          },
        )
      ],
    );
  }

  _buildGenderSelect() {
    return Wrap(
      children: <Widget>[
        Consumer<ProfileBloc>(
          builder: (context, model, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.blue,
                  ),
                  child: Radio(
                    value: 0,
                    groupValue: model.radioGenderValue,
                    onChanged: (value) => model.radioGenderValue = 0,
                  ),
                ),
                Text(
                  'Nam',
                  style: TextStyle(
                    color: darkMode ? kTextDarkColor : kTextColor,
                  ),
                ),
                SizedBox(width: 20),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.blue,
                  ),
                  child: Radio(
                    value: 1,
                    groupValue: model.radioGenderValue,
                    onChanged: (value) => model.radioGenderValue = 1,
                  ),
                ),
                Text(
                  'Nữ',
                  style: TextStyle(
                    color: darkMode ? kTextDarkColor : kTextColor,
                  ),
                ),
                SizedBox(width: 20),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.blue,
                  ),
                  child: Radio(
                    value: 2,
                    groupValue: model.radioGenderValue,
                    onChanged: (value) => model.radioGenderValue = 2,
                  ),
                ),
                Text(
                  'Không rõ',
                  style: TextStyle(
                    color: darkMode ? kTextDarkColor : kTextColor,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  _buildButtonUpdateProfile(ProfileBloc profileBloc) {
    return StreamBuilder<bool>(
      stream: profileBloc.btnStream,
      builder: (context, snapshot) {
        return RoundedButton(
          text: 'Chỉnh sửa',
          textColor: Colors.white,
          backgroundColor:
              snapshot.data == true ? Colors.blueAccent : Colors.grey,
          borderColor: Colors.white,
          onPressed: () {
            if (snapshot.data != true) return;

            print('Update profile v2');
            _showDialog(profileBloc);
          },
        );
      },
    );
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild.context.widget is! EditableText);
  }
}
