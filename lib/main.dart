import 'package:flutter/material.dart';
import 'package:login/view/pages/home.dart';
import 'package:login/view/pages/login.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Login()),
        GetPage(name: '/home', page: () => Home()),
      ]
  ));
}


