import 'dart:async';

import 'package:coding_with_itmc/config.dart';
import 'package:coding_with_itmc/login/login_model.dart';
import 'package:coding_with_itmc/models/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with ChangeNotifier {
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  var emailValidation, passValidation;

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(emailValidation);

  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream =>
      _passSubject.stream.transform(passValidation);

  Sink<String> get passSink => _passSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;

  Sink<bool> get btnSink => _btnSubject.sink;

  LoginBloc() {
    emailValidation =
        StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
      sink.add(validateEmail(email));
    });

    passValidation =
        StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
      sink.add(validatePassword(pass));
    });

    Rx.combineLatest2(_emailSubject.stream, _passSubject.stream, (email, pass) {
      return validateEmail(email) == null && validatePassword(pass) == null;
    }).listen((event) {
      btnSink.add(event);
    });
  }

  Future<Notify> doLogin(String email, String pass) async{
    return LoginModel().requestLogin(email.trim(), pass);
  }

  String validateEmail(String email) {
    if (email == null || email.length == 0) return 'Email không được bỏ trống';
    return null;
  }

  String validatePassword(String pass) {
    if (pass == null || pass.length == 0) return 'Mật khẩu không được bỏ trống';
    return null;
  }

  bool isUserStored(String email, String pass){
    return email.compareTo(userStore.email) == 0 && pass.compareTo(userStore.pass) == 0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}
