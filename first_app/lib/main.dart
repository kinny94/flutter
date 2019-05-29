import 'package:first_app/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:first_app/product_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),
      home: HomePage(),
    );
  }
}
