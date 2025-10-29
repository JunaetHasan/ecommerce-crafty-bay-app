import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crafty_bay/application/state_holder_binder.dart';
import 'package:crafty_bay/ui/screens/splash_screen.dart';
import 'package:crafty_bay/theme/u_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
 static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
   const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  late final StreamSubscription _connectivityStatusStream;

  @override
  void initState() {
    checkInternetConnectivityStatus();
    checkInitialInternetConnection();
    super.initState();
  }

  void checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handelConnectivityStatus(result as ConnectivityResult);
  }

  void checkInternetConnectivityStatus() {
    _connectivityStatusStream =
        Connectivity().onConnectivityChanged.listen((statusList) {
          final status = statusList.first; // ✅ fix
          handelConnectivityStatus(status);
        });
  }


  void handelConnectivityStatus(ConnectivityResult status) {
    if (status != ConnectivityResult.mobile && status != ConnectivityResult.wifi) {
      if (!Get.isSnackbarOpen) {
        Get.showSnackbar(GetSnackBar(
          title: 'No internet',
          message: 'Please check your internet connection',
          isDismissible: false,
          duration: const Duration(days: 1),
        ));
      }
      print('no internet');
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
      print('connected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      initialBinding: StateHolderBinder(),
      themeMode: ThemeMode.system,
      theme: UTheme.ligthTheme,
      home: SplashScreen(),

    );

}


@override
  void dispose() {
    _connectivityStatusStream.cancel();
    super.dispose();
  }
}

