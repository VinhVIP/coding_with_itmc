import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/components/rounded_text_field.dart';
import 'package:coding_with_itmc/home/ui.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/login/login_bloc.dart';
import 'package:coding_with_itmc/models/notification.dart';
import 'package:coding_with_itmc/signup/signup_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context, title: 'Login'),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<LoginBloc>(
        create: (_) => LoginBloc(),
        child: LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    SharedPreferencesManager.getUserStore();

    emailController.addListener(() {
      Provider
          .of<LoginBloc>(context, listen: false)
          .emailSink
          .add(emailController.text);
    });
    passController.addListener(() {
      Provider
          .of<LoginBloc>(context, listen: false)
          .passSink
          .add(passController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginBloc = Provider.of<LoginBloc>(context, listen: false);
    emailController.text = userStore.email;
    passController.text = userStore.pass;

    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              SizedBox(height: 25),
              _buildEmailInput(loginBloc.emailStream),
              SizedBox(height: 5),
              _buildPasswordInput(loginBloc.passStream),
              SizedBox(height: 10),
              _buildButtonLogin(loginBloc),
              _buildButtonForgotPass(),
              SizedBox(height: 20),
              _buildButtonSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Stack(
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
    );
  }

  _buildEmailInput(emailStream) {
    return StreamBuilder<String>(
      stream: emailStream,
      builder: (_, __) {
        return RoundedTextField(
          controller: emailController,
          hintText: "Email",
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        );
      },
    );
  }

  _buildPasswordInput(passStream) {
    return StreamBuilder<String>(
      stream: passStream,
      builder: (_, __) {
        return RoundedTextField(
          controller: passController,
          hide: true,
          hintText: "Password",
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        );
      },
    );
  }

  _buildButtonLogin(loginBloc) {
    return StreamBuilder<bool>(
        stream: loginBloc.btnStream,
        builder: (context, snapshot) {
          return RoundedButton(
            text: 'Đăng nhập',
            textColor: Colors.white,
            backgroundColor:
            snapshot.data == true ? Colors.blueAccent : Colors.grey,
            borderColor: Colors.white,
            onPressed: () {
              if (snapshot.data != true) return;

              print('Login v2');
              _showDialogLogin(context, loginBloc);
            },
          );
        });
  }

  _buildButtonForgotPass() {
    return FlatButton(
      child: Text(
        'Quên mật khẩu ?',
        style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300),
      ),
      onPressed: () {
        print('Forget password');
      },
    );
  }

  _buildButtonSignUp() {
    return RoundedButton(
      text: 'Đăng kí tài khoản mới',
      textColor: Colors.blueAccent,
      backgroundColor: Colors.white,
      borderColor: Colors.blueAccent,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()))
            .then((value) {
          if (value != null)
            setState(() {
              print('Choose user: ${userSignUp.email} : ${userSignUp.pass}');
              emailController?.text = userSignUp.email;
              passController?.text = userSignUp.pass;
            });
        });
      },
    );
  }

  _goToHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  _showDialogLogin(BuildContext context, LoginBloc loginBloc) async {
    Widget widgetSaveUser = Row(
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
            SharedPreferencesManager.saveUserLogged(
                true, emailController.text, passController.text);
            SharedPreferencesManager.saveUserStore(
                emailController.text, passController.text);
            _goToHomePage();
          },
        ),
        FlatButton(
          child:
          Text('Không', style: TextStyle(color: Colors.blue, fontSize: 18)),
          onPressed: () {
            SharedPreferencesManager.saveUserLogged(
                true, emailController.text, passController.text);
            _goToHomePage();
          },
        ),
      ],
    );

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
                future: loginBloc.doLogin(
                    emailController.text, passController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Notify notify = snapshot.data;

                    return Column(
                      children: <Widget>[
                        Center(child: Text(notify.message)),
                        (notify.code == 200 &&
                            !loginBloc.isUserStored(
                                emailController.text.trim(),
                                passController.text))
                            ? Text('Lưu mật khẩu?')
                            : SizedBox(height: 1),
                        SizedBox(height: 10),
                        (notify.code == 200 &&
                            !loginBloc.isUserStored(
                                emailController.text.trim(),
                                passController.text))
                            ? widgetSaveUser
                            : FlatButton(
                          child: Text(
                            'OK',
                            style: TextStyle(
                                color: Colors.blue, fontSize: 18),
                          ),
                          onPressed: () {
                            if (notify.code == 200) {
                              SharedPreferencesManager.saveUserLogged(
                                  true, emailController.text.trim(),
                                  passController.text);
                              _goToHomePage();
                            } else {
                              Navigator.of(context).pop();
                            }
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
}
