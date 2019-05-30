import 'package:first_app/pages/products.dart';
import 'package:first_app/product_manager.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('LOGIN'),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage()
            ));
          },
        ),
      )
    );
  }
}