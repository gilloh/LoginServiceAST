import 'package:flutter/material.dart';
import 'package:login_service_ast/pages/login_page.dart';
import 'package:login_service_ast/pages/home_page.dart';
import 'package:login_service_ast/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Service',
      theme: ThemeData.light(),
      home: SplashPage(),
      routes: routes,
    );
  }
}