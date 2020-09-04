import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../config.dart';

class ProfileBloc with ChangeNotifier {

  String _firstName, _lastName;

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
    notifyListeners();
  }
  get lastName => _lastName;

  set lastName(value) {
    _lastName = value;
    notifyListeners();
  }

  String _dateOfBirth;
  int _radioGenderValue;
  bool _viewProfile;

  bool get viewProfile => _viewProfile;

  set viewProfile(bool value) {
    _viewProfile = value;
    notifyListeners();
  }

  int get radioGenderValue => _radioGenderValue;

  set radioGenderValue(int value) {
    _radioGenderValue = value;
    notifyListeners();
  }

  String get dateOfBirth => _dateOfBirth;

  set dateOfBirth(String value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  final _firstNameSubject = BehaviorSubject<String>();
  final _lastNameSubject = BehaviorSubject<String>();
  final _studentIDSubject = BehaviorSubject<String>();
  final _schoolSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  var firstNameValidation, lastNameValidation, studentIDValidation, schoolValidation;

  Stream<String> get firstNameStream => _firstNameSubject.stream.transform(firstNameValidation).skip(1);
  Stream<String> get lastNameStream => _lastNameSubject.stream.transform(lastNameValidation).skip(1);
  Stream<String> get studentIDStream => _studentIDSubject.stream.transform(studentIDValidation).skip(1);
  Stream<String> get schoolStream => _schoolSubject.stream.transform(schoolValidation).skip(1);

  Sink<String> get firstNameSink => _firstNameSubject.sink;
  Sink<String> get lastNameSink => _lastNameSubject.sink;
  Sink<String> get studentIDSink => _studentIDSubject.sink;
  Sink<String> get schoolSink => _schoolSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  ProfileBloc(){
    firstName = user.firstName;
    lastName = user.lastName;
    dateOfBirth = user.dateOfBirth ?? '01/01/2000';
    radioGenderValue = user.gender ?? 2;
    viewProfile = true;

    firstNameValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (firstName, sink) {
          sink.add(validateFirstName(firstName));
        });
    lastNameValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (lastName, sink) {
          sink.add(validateLastName(lastName));
        });
    studentIDValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (studentID, sink) {
          sink.add(validateStudentID(studentID));
        });
    schoolValidation = StreamTransformer<String, String>.fromHandlers(
        handleData: (school, sink) {
          sink.add(validateSchool(school));
        });

    Rx.combineLatest4(_firstNameSubject.stream, _lastNameSubject.stream, _studentIDSubject, _schoolSubject,
            (firstName, lastName, studentID, school) {
          return
              validateFirstName(firstName) == null &&
              validateLastName(lastName) == null &&
              validateStudentID(studentID) == null &&
              validateSchool(school) == null;
        }).listen((event) {
      btnSink.add(event);
    });

  }

  String validateFirstName(String firstName) {
//    firstName = firstName?.trim();

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

  String validateStudentID(String studentID) {
    if (studentID == null || studentID.length == 0) {
      return 'Mã sinh viên không được bỏ trống';
    } else if (studentID.contains(' ')) {
      return 'Mã sinh viên không được chứa khoảng trắng';
    } else {
      return null;
    }
  }

  String validateSchool(String school) {
    if (school == null || school.trim().length == 0) {
      return 'Mã sinh viên không được bỏ trống';
    } else {
      return null;
    }
  }

  String convertDateOfBirth(String date) {
    if (date != null && date.length > 0) {
      List<String> s = date.split("/");
      assert(s.length == 3);
      return s[2] + "-" + s[0] + "-" + s[1];
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameSubject.close();
    _lastNameSubject.close();
    _studentIDSubject.close();
    _schoolSubject.close();
    _btnSubject.close();
  }


}
