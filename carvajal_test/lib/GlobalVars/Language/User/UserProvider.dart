import 'package:carvajal_test/back/controllers/AuthController.dart';
import 'package:carvajal_test/back/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  set user(UserModel? user) {
    this._user = user;
    notifyListeners();
  }

  Future<UserModel?> login(values) async {
    UserModel us = UserModel(
        address: "address",
        email: "email.com.co",
        gender: "Masculino",
        lastname: "lastname",
        name: "name");
    this._user = us;
    notifyListeners();
    return us;
/*    dynamic response = await AuthController.login(values);
    if (response == null || response['user'] == null)
      this._user = null;
    else
      this._user = UserModel.fromJson(response['user']);
    notifyListeners();
    return this._user;
*/
  }

  Future<UserModel?> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? email = sp.getString("email");
    String? password = sp.getString("password");
    if (email == null || password == null)
      return null;
    else {
      UserModel us = UserModel(
          address: "address",
          email: "email.com.co",
          gender: "Masculino",
          lastname: "lastname",
          name: "name");
      this._user = us;
      notifyListeners();
      return us;
//      dynamic values = {"email": email, "password": password};
      //    return await this.login(values);
    }
  }

  Future<UserModel?> register(Map<String, dynamic> values) async {
    bool registred = await AuthController.register(values);
    if (registred) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString("email", values["email"]);
      sp.setString("password", values["password"]);
      UserModel reg = UserModel.fromJson(values);
      this._user = reg;
      notifyListeners();
      return this._user;
    } else
      return null;
  }
}
