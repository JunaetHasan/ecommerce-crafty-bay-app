import 'package:crafty_bay/main_buttom_nav_bar/main_buttom_bav_screen.dart';
import 'package:crafty_bay/state_holders/auth_controller.dart';
import 'package:crafty_bay/u_color/u_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/screen_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }
void  goToNextScreen (){
   Future.delayed(Duration(seconds: 3)).then((_) async {
     AuthController.getAccessToken();
     Get.offAll(()=> AuthController.isLogin ? MainButtomBavScreen() : MainButtomBavScreen ());
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
           ScreenLgo(),
          const Spacer(),
          CircularProgressIndicator(
            color: UColor.brown,
          ),
          Text('version 1.3.85'),
        ],
      ),
    );
  }
}

