import 'dart:convert';

import 'package:flutter_learning_demo/shared/api_constants.dart';
import 'package:flutter_learning_demo/shared/api_service.dart';
import 'package:flutter_learning_demo/shared/user.dart';

class LoginService extends APIService {
  LoginService._internal();

  static final LoginService _instance = LoginService._internal();

  factory LoginService() => _instance;

  Future<User> getUser() async {
    final response = await super.dio.get(APIConstants.user);
    if (response.statusCode == 200) {
      return userFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }

  Future<bool> login(String username, String password) async {
    var user = await getUser();
    if (username == user.username && password == user.password) {
      return true;
    }
    return false;
  }

}