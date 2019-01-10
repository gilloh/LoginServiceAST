import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:login_service_ast/common/functions/getToken.dart';
import 'package:login_service_ast/common/functions/saveLogout';
import 'package:login_service_ast/model/json/loginModel.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "http://www.mocky.io/v2/5c375ea43000005a001f63ed";

  var token;

  await getToken().then((result){
    token = result;
  });

  final response = await http.post(
    url,
    headers: {HttpG}
  )
}
