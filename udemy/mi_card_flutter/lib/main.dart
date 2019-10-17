import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: 
          Container(
            height: 100.0,
            width: 100.0,
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
            padding: EdgeInsets.all(20.0),
            color: Colors.white,
            child: Text('Hello')
          ), 
        ),
      ),
    ),
  );
}
