import 'dart:convert';

import 'package:carvajal_test/back/api/HostApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  static Future<Map<String, dynamic>?> login(values) async {
    const relativeUrl = '/login';
    dynamic responseText = await HostApi.post(relativeUrl, values);
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (responseText == null) {
      sp.remove('email');
      sp.remove('password');
      return null;
    }
    Map<String, dynamic> response = jsonDecode(responseText);
    sp.setString('email', values['email']);
    sp.setString('password', values['password']);
    return response;
  }

  static Future<Map<String, dynamic>?> logout(values) async {
    const relativeUrl = '/logout';
    dynamic responseText = await HostApi.post(relativeUrl, values);
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (responseText == null) {
      sp.remove('email');
      sp.remove('password');
      return null;
    }
    Map<String, dynamic> response = jsonDecode(responseText);
    sp.setString('token', response['token']);
    return response;
  }

}