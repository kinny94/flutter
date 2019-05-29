import 'package:flutter/material.dart';

import 'package:first_app/product_manager.dart';

class HomePage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Easylist'),
      ),
      body: ProductManager()
    );
  }
}