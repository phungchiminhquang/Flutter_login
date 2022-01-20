import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  startTime() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Get.toNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    startTime();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          ),
          
          Center(
            child: Container(
              child: Image.asset(
                "assets/bk_logo.png",
                width: 129.0,
                height: 120.0,
              ),

            ),
          )
        ],
      ),
    );;
  }
}