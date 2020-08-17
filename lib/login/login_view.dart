import 'dart:convert';

import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/components/rounded_text_field.dart';
import 'package:coding_with_itmc/config.dart';
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
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          letterSpacing: 2,
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
                          letterSpacing: 2,
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
                    hintText: "Email or Account",
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
                    child: Text('Quên mật khẩu ?'),
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
                      print('You clicked signup');
                    },
                  ),
                ],
              ),
            ),
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
    return buildAppbar(context, title: title, leading: leading);
  }

  Future<void> _showDialogLogin(BuildContext context) async {
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Đang đăng nhập')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FutureBuilder<int>(
                  future:
                      _loginRequest(emailController.text, passController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int code = snapshot.data;
                      if (code == 200) {
                        print("Token: $token");
                        Navigator.pop(context, 'OK');
                        return Text('');
                      } else {
                        return Text('Email hoặc pass không đúng');
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
              ),
            ],
          );
        },
    ).then((value) {
      if(value.compareTo("OK") == 0){
        Navigator.of(context).pop();
      }
    });
  }

  Future<int> _loginRequest(String email, String pass) async {
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
      if(response.statusCode == 200) token = responseJson['data']['accessToken'];
      return response.statusCode;
    } catch (e) {
      print('error: $e');
    }
    return -1;
  }

  Future<String> _httpPost() async {
    try {
      final http.Response response = await http.post(
        'https://itmc.herokuapp.com/api/v1/auth/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': 'vinh@gmail.com',
          'password': '123456',
        }),
      );

      if (response.statusCode == 200) {
//        print(response.body);
        var responseJson = json.decode(response.body);
        print("${responseJson['message']}");
        String token = responseJson['data']['accessToken'];
        print("token: $token");

        // Get profile
        final http.Response responseProfile = await http.get(
          'https://itmc.herokuapp.com/api/v1/user/profile',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        print(responseProfile.body);
      } else {
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('Catch error: $e');
    }
  }
}
