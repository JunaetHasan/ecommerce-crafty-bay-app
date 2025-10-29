import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  AuthController._();

  static String? _accessToken;
 static String? get accessToken => _accessToken;


  static Future<void> setAccessToken (String token) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user-token', token);
    _accessToken = token;

  }
  static Future<void> getAccessToken () async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access-token');

  }
  static Future<void> clearUserInfo () async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

static  bool get isLogin {
    return _accessToken != null;
  }

}