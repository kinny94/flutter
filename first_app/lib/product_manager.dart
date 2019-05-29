import 'package:flutter/material.dart';

import 'package:first_app/products.dart';

class ProductManager extends StatefulWidget {

  final String startingProduct; // final cause its technically a seperated class. only state class below you can avoid final
  
  ProductManager({this.startingProduct = 'Sweets Tester'});

  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {

  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products.add(widget.startingProduct); // widget property is provided to flutter to access parent properties.
  }

  Widget build(BuildContext context) {
    return Column( children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
                _products.add('Advanced Food Tester');
            });
          },
          child: Text('Add Product'),
        ),
      ),
      Products(_products)
    ]);
  }
}