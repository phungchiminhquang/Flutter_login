import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('this is Home Page',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
