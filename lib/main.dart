import 'package:flutter/material.dart';
import 'package:login/view/pages/NavigationScreen.dart';
import 'package:login/view/pages/homeScreen.dart';
import 'package:login/view/pages/loginScreen2.dart';
import 'package:get/get.dart';
import 'package:login/view/pages/splashScreen.dart';
void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/navigation', page: () => NavigationScreen()),
      ]
  ));
}


