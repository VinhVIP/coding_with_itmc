import 'dart:async';

import 'package:coding_with_itmc/models/notification.dart';
import 'package:coding_with_itmc/signup/signup_model.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc with ChangeNotifier {

  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _firstNameSubject = BehaviorSubject<String>();
  final _lastNameSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  var emailValidation, passValidation, firstNameValidation, lastNameValidation;

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(emailValidation).skip(1);

  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream =>
      _passSubject.stream.transform(passValidation).skip(1);

  Sink<String> get passSink => _passSubject.sink;

  Stream<String> get firstNameStream =>
      _firstNameSubject.stream.transform(firstNameValidation).skip(1);

  Sink<String> get firstNameSink => _firstNameSubject.sink;

  Stream<String> get lastNameStream =>
      _lastNameSubject.stream.transform(lastNameValidation).skip(1);

  Sink<String> get lastNameSink => _lastNameSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;

  Sink<bool> get btnSink => _btnSubject.sink;

  SignUpBloc() {
    emailValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (email, sink) {
      sink.add(validateEmail(email));
    });
    passValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (pass, sink) {
      sink.add(validatePassword(pass));
    });
    firstNameValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (firstName, sink) {
      sink.add(validateFirstName(firstName));
    });
    lastNameValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (lastName, sink) {
      sink.add(validateLastName(lastName));
    });

    Rx.combineLatest4(_emailSubject.stream, _passSubject.stream, _firstNameSubject.stream, _lastNameSubject.stream,
        (email, pass, firstName, lastName) {
      return validateEmail(email) == null &&
          validatePassword(pass) == null &&
          validateFirstName(firstName) == null &&
          validateLastName(lastName) == null;
    }).listen((event) {
      btnSink.add(event);
    });
  }

  Future<Notify> doSignUp(String email, String pass, String firstName, String lastName) async{
    return SignUpModel().requestSignUp(email.trim(), pass, firstName.trim(), lastName.trim());
  }

  String validateEmail(String email) {
    if (email == null || email.length == 0) {
      return 'Email không được bỏ trống';
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return null;
    } else {
      return 'Định dạng email không hợp lệ';
    }
  }

  String validatePassword(String pass) {
    if (pass == null || pass.length == 0) {
      return 'Mật khẩu không được bỏ trống';
    } else if (RegExp(r'^([a-zA-Z0-9]){6,}$').hasMatch(pass)) {
      return null;
    } else {
      return 'Chỉ chứa chữ cái latin và số, ít nhất 6 kí tự';
    }
  }

  String validateFirstName(String firstName) {
    firstName = firstName?.trim();

    if (firstName == null || firstName.length == 0) {
      return 'Họ và tên đệm không được bỏ trống';
    } else if (RegExp("  +").hasMatch(firstName)) {
      return 'Chỉ chứa tối đa 1 khoảng trắng';
    } else {
      return null;
    }
  }

  String validateLastName(String lastName) {
    if (lastName == null || lastName.length == 0) {
      return 'Tên không được bỏ trống';
    } else if (lastName.contains(" ")) {
      return 'Tên không được chứa khoảng trắng';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();

    _emailSubject.close();
    _passSubject.close();
    _firstNameSubject.close();
    _lastNameSubject.close();
    _btnSubject.close();
  }
}
