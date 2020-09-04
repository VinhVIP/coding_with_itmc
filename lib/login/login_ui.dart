import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/dialog.dart';
import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/components/rounded_text_field.dart';
import 'package:coding_with_itmc/home/ui.dart';
import 'package:coding_with_itmc/lib/shared_preference.dart';
import 'package:coding_with_itmc/login/login_bloc.dart';
import 'package:coding_with_itmc/signup/signup_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../config.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context, title: 'Login'),
      backgroundColor: darkMode ? kBackgroundDarkColor : Colors.white,
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
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool _saveUser = true;

  @override
  void initState() {
    emailController.text = userStore.email;
    passController.text = userStore.pass;

    emailController.addListener(() {
      Provider.of<LoginBloc>(context, listen: false)
          .emailSink
          .add(emailController.text);
    });
    passController.addListener(() {
      Provider.of<LoginBloc>(context, listen: false)
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
    loginBloc.emailSink.add(emailController.text);
    loginBloc.passSink.add(passController.text);

    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              SizedBox(height: 25),
              _buildEmailInput(loginBloc.emailStream),
              SizedBox(height: 5),
              _buildPasswordInput(loginBloc.passStream),
              _buildCheckboxSavePassword(),
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
            Icons.lock,
            color: Colors.white,
          ),
        );
      },
    );
  }

  _buildCheckboxSavePassword() {
    return Row(
      children: <Widget>[
        SizedBox(width: 10),
        Checkbox(
          value: _saveUser,
          onChanged: (bool value) {
            setState(() {
              _saveUser = value;
            });
          },
        ),
        Text(
          'Lưu thông tin đăng nhập',
          style: TextStyle(
              color: darkMode ? kTextDarkColor : kTextColor,
              fontFamily: 'Oswald',
              fontSize: 15),
        ),
      ],
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
//              _showDialogLogin(context, loginBloc);
              _showDialog(loginBloc);
            },
          );
        });
  }

  _showDialog(LoginBloc loginBloc) async {
    showDialogLoading(context, 'Đăng nhập');
    final loginResult = await loginBloc.doLogin(
        emailController.text.trim(), passController.text);
    Navigator.pop(context, true);
    print(loginResult.code);

    if (loginResult.code == 200) {
      SharedPreferencesManager.saveUserLogged(
          true, emailController.text, passController.text);
      if (_saveUser) {
        SharedPreferencesManager.saveUserStore(
            emailController.text, passController.text);
      }
      _goToHomePage();
    } else {
      showDialogNotification(context, 'Đăng nhập', loginResult);
    }
  }

  _buildButtonForgotPass() {
    return FlatButton(
      splashColor: Colors.greenAccent,
      child: Text(
        'Quên mật khẩu ?',
        style: TextStyle(
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w300,
            color: darkMode ? kTextDarkColor : kTextColor),
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
      backgroundColor: darkMode ? kBackgroundDarkColor : Colors.white,
      borderColor: Colors.blueAccent,
      onPressed: () {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()))
            .then((value) {
          if (value != null)
            setState(() {
              print('Choose user: ${userSignUp.email} : ${userSignUp.pass}');
              emailController.text = userSignUp.email;
              passController.text = userSignUp.pass;
            });
        });
      },
    );
  }

  _goToHomePage() {
    Navigator.of(context).pop();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

}
