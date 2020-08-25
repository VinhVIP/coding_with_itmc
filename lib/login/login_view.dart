import 'dart:convert';
import 'dart:ui';

import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/components/rounded_text_field.dart';
import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/home/ui.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/models/notification.dart';
import 'package:coding_with_itmc/signup/signup_ui.dart';
import 'package:coding_with_itmc/signup/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController, passController;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  void initState() {
    SharedPreferencesManager.getUserValue();

    print('${user.email} : ${user.pass}');

    emailController = TextEditingController(text: user.email);
    passController = TextEditingController(text: user.pass);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: _buildAppbar(context, 'Login'),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oswald',
                            letterSpacing: 4,
                            fontSize: 30,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.blue[800],
                          ),
                        ),
                        Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oswald',
                            letterSpacing: 4,
                            fontSize: 30,
                            color: Colors.lightBlue,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedTextField(
                      controller: emailController,
                      hintText: "Email",
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      onChanged: (value) {},
                    ),
                    RoundedTextField(
                      controller: passController,
                      hide: true,
                      hintText: "Password",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: 'Đăng nhập',
                      textColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      borderColor: Colors.white,
                      onPressed: () {
                        _showDialogLogin(context);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Quên mật khẩu ?',
                        style: TextStyle(
                            fontFamily: 'Oswald', fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        print('Forget password');
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RoundedButton(
                      text: 'Đăng kí tài khoản mới',
                      textColor: Colors.blueAccent,
                      backgroundColor: Colors.white,
                      borderColor: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()))
                            .then((value) {
                          if (value != null)
                            setState(() {
                              print(
                                  'Choose user: ${userSignUp[0]} : ${userSignUp[1]}');
                              emailController?.text = userSignUp[0];
                              passController?.text = userSignUp[1];
                            });
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAppbar(BuildContext context, String title) {
    return buildAppbar(context, title: title, leading: null);
  }

  Future<void> _showDialogLogin(BuildContext context) async {
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
            'Đăng nhập',
            style: TextStyle(color: Colors.indigo, fontSize: 22),
          )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FutureBuilder<Notify>(
                future:
                    _loginRequest(emailController.text, passController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Notify notify = snapshot.data;
                    return Column(
                      children: <Widget>[
                        Text(notify.message),
                        SizedBox(height: 10),
                        notify.code == 200
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      'Lưu',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                      ),
                                    ),
                                    onPressed: () {
                                      SharedPreferencesManager.saveUserLogin(
                                          emailController.text,
                                          passController.text);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      'Không',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
//                                      Navigator.of(context).pop('Cancel');
                                    },
                                  ),
                                ],
                              )
                            : FlatButton(
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
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
      if (value != null && value.compareTo("OK") == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Future<Notify> _loginRequest(String email, String pass) async {
    try {
      final http.Response response = await http.post(
        urlAuthLogin,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': pass,
        }),
      );
      var responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        token = responseJson['data']['accessToken'];

        await _fetchUser();

        return Notify(
            response.statusCode, "Đăng nhập thành công! Lưu mật khẩu?");
      } else if (response.statusCode == 400) {
        return Notify(response.statusCode, "Email hoặc mật khẩu không đúng");
      } else {
        return Notify(-1, responseJson['error']['descriptions']);
      }
    } catch (e) {
      print('error: $e');
      return Notify(-1, 'Có lỗi xảy ra');
    }
  }

  Future<void> _fetchUser() async {
    print('fetch: $token');
    final response = await http.get(
      urlUserProfile,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('profile: ${response.body}');

    if (response.statusCode == 200) {
      user.convert(json.decode(response.body)['data']);
      user.email = emailController.text;
      user.login = true;
      print("Name: " + user.firstName + " " + user.lastName);
    } else {
      print('Error: Can not get profile');
    }
  }
}
