import 'dart:convert';

import 'package:coding_with_itmc/models/notification.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class SignUpModel{

  // Call api SignUp
  Future<Notify> requestSignUp(String email, String pass, String firstName, String lastName) async {
    try {
      final http.Response response = await http.post(
        urlAuthSignUp,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': pass,
        }),
      );

      if (response.statusCode == 201) {
        print('SignUp successfully');
        return Notify(response.statusCode, "Đăng ký thành công!");
      }else if(response.statusCode == 400){
//        String mess = "";
//        var list = json.decode(response.body)['error']['message'];
//        for (String s in list) {
//          mess += s + "\n";
//        }
        return Notify(response.statusCode, json.decode(response.body)['error']['message']);
      }else{
        return Notify(response.statusCode, "Server hiện đang lỗi :(");
      }
    } catch (e) {
      print('error: $e');
      return Notify(-1, 'Có lỗi xảy ra');
    }
  }


}