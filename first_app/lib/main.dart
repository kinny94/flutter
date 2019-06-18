import 'package:first_app/models/product.dart';
import 'package:first_app/pages/auth.dart';
import 'package:first_app/pages/product.dart';
import 'package:flutter/material.dart';

import 'package:first_app/pages/products_admin.dart';
import 'package:first_app/pages/products.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

 List<Product> _products  = [];

 void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _updateProduct(int index, Product product) {
    setState(() {
      _products[index] = product;
    });
  }


  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        buttonColor: Colors.deepPurple,
      ),
      //home: AuthPage(), // No need for this if you already have '/' in your routes
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductAdminPage(_addProduct, _updateProduct,  _deleteProduct, _products),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[0] != 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(builder: 
            (BuildContext context) => ProductPage(
              _products[index].title, _products[index].image, _products[index].price, _products[index].description
            )
          );
        }
        
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: 
          (BuildContext context) => ProductsPage(_products)
        );
      },
    );
  }
}
