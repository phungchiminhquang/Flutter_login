import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map page"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            "Bản đồ",
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