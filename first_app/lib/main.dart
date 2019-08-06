import 'package:first_app/models/product.dart';
import 'package:first_app/pages/auth.dart';
import 'package:first_app/pages/product.dart';
import 'package:first_app/scoped-models/main.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:flutter/material.dart';

import 'package:first_app/pages/products_admin.dart';
import 'package:first_app/pages/products.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple,
        ),
        //home: AuthPage(), // No need for this if you already have '/' in your routes
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ProductsAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');

          if (pathElements[0] != '') {
            return null;
          }

          if (pathElements[0] != 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(builder: 
              (BuildContext context) => ProductPage(index)
            );
          }
          
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: 
            (BuildContext context) => ProductsPage()
          );
        },
      ),
    );
  }
}
