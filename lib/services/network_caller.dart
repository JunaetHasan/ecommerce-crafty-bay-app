import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/application/app.dart';
import 'package:crafty_bay/state_holders/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../data/model/network_response.dart';
import '../ui/screens/email_screen.dart';

class NetworkCaller {


  /// get request method
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url), headers: {'Content-Type': 'application/json',"token" : AuthController.setAccessToken.toString()});
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 /* && jsonDecode(response.body)['msg'] == 'success'*/) {
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        goToLoginScreen();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  static Future<NetworkResponse> postRequest(
    String url,
    Map<String, dynamic> body, {
    bool isLogin = false,
  }) async {
    try {
      Response response = await post(Uri.parse(url), headers: {'Content-Type': 'application/json', "token": AuthController.setAccessToken.toString(),
      });
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200)/* && jsonDecode(response.body)['msg'] == 'success'*/
      {
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        goToLoginScreen();
        if (isLogin == false) {}
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  static Future<void> goToLoginScreen ()async {
    await AuthController.clearUserInfo();
    Navigator.pushAndRemoveUntil(

      CraftyBay.globalKey.currentState!.context,
      MaterialPageRoute(builder: (BuildContext context) => const EmailScreen()),
      ModalRoute.withName('/'),
    );
  }
}

