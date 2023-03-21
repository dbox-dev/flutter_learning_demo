import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/home/screens/home_screen.dart';
import 'package:flutter_learning_demo/login/screens/login_screen.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';

  static get all => <String, WidgetBuilder>{
    login: (context) => LoginScreen(), // demo how to used widget
    home: (context) => const HomeScreen(),
  };
}