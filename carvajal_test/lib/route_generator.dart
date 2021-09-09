import 'package:carvajal_test/screens/DetailedProductPage.dart';
import 'package:carvajal_test/screens/HomePage.dart';
import 'package:carvajal_test/screens/LoginPage.dart';
import 'package:carvajal_test/screens/RegisterPage.dart';
import 'package:carvajal_test/screens/SplashPage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RegisterPage.route:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case LoginPage.route:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => HomePage());
      case DetailedProductPage.route:
        DetailedProductPage args2 = args as DetailedProductPage;
        return MaterialPageRoute(builder: (_) => DetailedProductPage(id: args2.id,));
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
