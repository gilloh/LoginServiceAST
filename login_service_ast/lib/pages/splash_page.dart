import 'package:flutter/material.dart';
import 'dart:async';
import 'package:login_service_ast/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  static String tag = 'splash-page';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final int _splashDuration = 2;

  _countDownTimer() async {
    return Timer(
        Duration(
          seconds: _splashDuration,
        ), () {
      Navigator.of(context).pushReplacementNamed(LoginPage.tag);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countDownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(60.0),
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
