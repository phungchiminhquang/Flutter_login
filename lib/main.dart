import 'package:flutter/material.dart';
import 'package:login/pages/login.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context)=>Login(),
    },
  ));
}


