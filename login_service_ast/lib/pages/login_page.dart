import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_service_ast/common/functions/showDialogSingleButton.dart';
import 'package:login_service_ast/common/functions/saveCurrentLogin.dart';
import 'package:login_service_ast/common/apifunctions/requestLoginAPI.dart';

const URL = 'https://astswiss.com/';

class LoginPage extends StatefulWidget {
  static final tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      showDialogSingleButton(
          context, 'Unable to reach your website', 'Currently unable to reach the website $URL', 'OK');
    }
  }

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute(LoginPage.tag);
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastPageRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
//          height: 800.0,
          padding: EdgeInsets.only(right: 60.0, left: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: Image.asset('images/logo.png'),
                onTap: () {
                  launchURL(URL);
                },
              ),
              Divider(),
              Image.asset('images/nfc.png', color: Colors.lightBlue),
              Divider(
                height: 100,
                color: Colors.transparent,
              ),
              ExpansionTile(
                backgroundColor: Colors.grey[100],
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(44, 109, 166, 1.0),
                  child: Icon(Icons.person),
                ),
                title: Text(
                  'Username/Password',
                  style: TextStyle(color: Color.fromRGBO(44, 109, 166, 1.0), fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  TextField(
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "username",
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "password",
                    ),
                    obscureText: true,
                  ),
                  RaisedButton(
                    child: Text("Login", style: TextStyle(color: Colors.lightBlue)),
                    onPressed: () {
                      requestLoginAPI(context, _usernameController.text, _passwordController.text);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
