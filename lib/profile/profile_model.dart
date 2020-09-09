import 'dart:convert';

import 'package:coding_with_itmc/models/notification.dart';
import 'package:http/http.dart' as http;

import '../config.dart';


class ProfileModel{

  Future<Notify> requestUpdateProfile(
      String firstName,
      String lastName,
      String gender,
      String dateOfBirth,
      String studentID,
      String school,
      String gravatar) async {
    try {
      final http.Response response = await http.put(
        urlUserProfile,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'firstName': firstName,
          'lastName': lastName,
          'gender': gender,
          'dateOfBirth': dateOfBirth,
          'studentID': studentID,
          'school': school,
          'gravatar': gravatar,
        }),
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        user.convert(json.decode(response.body)['data']);
        print('Updated successfully');
        return Notify(response.statusCode, 'Cập nhật thành công!');
      } else if (response.statusCode == 400) {
        String mess = "";
        var list = json.decode(response.body)['error']['descriptions'];
        for (String s in list) {
          mess += s + "\n";
        }

        return Notify(response.statusCode, json.decode(response.body)['error']['message']);
      } else if (response.statusCode == 401) {
        return Notify(response.statusCode, 'Unauthorized');
      } else {
        return Notify(response.statusCode, 'Server hiện đang bị lỗi :(');
      }
    } catch (e) {
      print('error: $e');
      return Notify(-1, 'Có lỗi xảy ra!');
    }
  }
}