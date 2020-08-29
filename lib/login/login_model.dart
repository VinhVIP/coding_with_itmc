import 'dart:convert';

import 'package:coding_with_itmc/models/notification.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class LoginModel{

  Future<Notify> requestLogin(String email, String pass) async {
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

        await fetchUser(email, pass);

        return Notify(
            response.statusCode, "Đăng nhập thành công");
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

  Future<void> fetchUser(String email, String pass) async {
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
      user.email = email;

      userLogin.email = email;
      userLogin.pass = pass;
      userLogin.isLogged = true;

      print("Name: " + user.firstName + " " + user.lastName);
    } else {
      print('Error: Can not get profile');
    }
  }
}