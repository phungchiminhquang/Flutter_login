import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting page"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            "Thiết lập",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}