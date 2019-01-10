import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:login_service_ast/model/json/loginModel.dart';
import 'package:login_service_ast/common/functions/saveCurrentLogin.dart';
import 'package:login_service_ast/common/functions/showDialogSingleButton.dart';
import 'package:login_service_ast/pages/home_page.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
  final url = 'http://www.mocky.io/v2/5c375a183000005a001f63d7';

  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );
  
  print(response.body);

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);

    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed(HomePage.tag);

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}
