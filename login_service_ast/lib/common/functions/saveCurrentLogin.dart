import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_service_ast/model/json/loginModel.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var user;
  if((responseJson != null && responseJson.isEmpty)) {
    user = LoginModel.fromJson(responseJson).userName;
  } else {
    user = '';
  }
  var token = (responseJson != null && responseJson.isEmpty) ? LoginModel.fromJson(responseJson).token : '';
  var pk = (responseJson != null && responseJson.isEmpty) ? LoginModel.fromJson(responseJson).userId : '';

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LastUserId', (pk != null && pk.length > 0) ? pk : "");
}