import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
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
                    hintText: "Email or Account",
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    onChanged: (value) {},
                  ),
                  RoundedTextField(
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
                      print('You clicked login');
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
}
