import 'package:coding_with_itmc/components/appbar.dart';
import 'package:coding_with_itmc/components/rounded_button.dart';
import 'package:coding_with_itmc/models/notification.dart';
import 'package:coding_with_itmc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context, 'SignUp'),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<SignUpBloc>(
        create: (_) => SignUpBloc(),
        child: SignUpWidget(),
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
}

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      Provider.of<SignUpBloc>(context, listen: false)
          .emailSink
          .add(emailController.text);
    });
    passController.addListener(() {
      Provider.of<SignUpBloc>(context, listen: false)
          .passSink
          .add(passController.text);
    });
    firstNameController.addListener(() {
      Provider.of<SignUpBloc>(context, listen: false)
          .firstNameSink
          .add(firstNameController.text);
    });
    lastNameController.addListener(() {
      Provider.of<SignUpBloc>(context, listen: false)
          .lastNameSink
          .add(lastNameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var signUpBloc = Provider.of<SignUpBloc>(context, listen: false);

    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              SizedBox(height: 25),
              _buildEmailInput(signUpBloc.emailStream),
              SizedBox(height: 20),
              _buildPasswordInput(signUpBloc.passStream),
              SizedBox(height: 20),
              _buildFirstNameInput(signUpBloc.firstNameStream),
              SizedBox(height: 20),
              _buildLastNameInput(signUpBloc.lastNameStream),
              SizedBox(height: 30),
              _buildButtonSignUp(signUpBloc),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Center(
      child: Stack(
        children: <Widget>[
          Text(
            'ĐĂNG KÝ',
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
            'ĐĂNG KÝ',
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
    );
  }

  _buildEmailInput(emailStream) {
    return StreamBuilder<String>(
      stream: emailStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            labelText: 'Email',
            hintText: 'Ví dụ: nguyenvanan@gmail.com',
            errorText: snapshot.data,
          ),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => context.nextEditableTextFocus(),
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }

  _buildPasswordInput(passStream) {
    return StreamBuilder<String>(
      stream: passStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: passController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mật khẩu',
            errorText: snapshot.data,
          ),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => context.nextEditableTextFocus(),
        );
      },
    );
  }

  _buildFirstNameInput(firstNameStream) {
    return StreamBuilder<String>(
      stream: firstNameStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: firstNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Họ và tên đệm',
            hintText: 'Ví dụ: Nguyễn Văn',
//                    errorText: _firstNameIsValid ? null : 'Họ và tên đệm không được bỏ trống',
            errorText: snapshot.data,
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
          controller: lastNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Tên',
            hintText: 'Ví dụ: An',
            errorText: snapshot.data,
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        );
      },
    );
  }

  _buildButtonSignUp(signUpBloc) {
    return StreamBuilder<bool>(
        stream: signUpBloc.btnStream,
        builder: (context, snapshot) {
          return RoundedButton(
            text: 'Đăng ký',
            textColor: Colors.white,
            backgroundColor:
                snapshot.data == true ? Colors.blueAccent : Colors.grey,
            borderColor: Colors.white,
            onPressed: () {
              if (snapshot.data != true) return;

              print('SignUp v2');
              _showDialogSignUp(context, signUpBloc);
            },
          );
        });
  }

  _showDialogSignUp(BuildContext context, SignUpBloc signUpBloc) async {
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
            'Đăng ký',
            style: TextStyle(color: Colors.indigo, fontSize: 22),
          )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FutureBuilder<Notify>(
                future: signUpBloc.doSignUp(
                    emailController.text,
                    passController.text,
                    firstNameController.text,
                    lastNameController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Notify notify = snapshot.data;

                    return Column(
                      children: <Widget>[
                        Text(notify.message),
                        SizedBox(height: 10),
                        FlatButton(
                          child: Text('OK', style: TextStyle(color: Colors.blue, fontSize: 18)),
                          onPressed: () {
                            if (notify.code == 201) {
                              userSignUp.email = emailController.text;
                              userSignUp.pass = passController.text;

                              Navigator.of(context).pop('OK');
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
      if (value?.compareTo('OK') == 0) {
        Navigator.of(context).pop('OK');
      }
    });
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild.context.widget is! EditableText);
  }
}
