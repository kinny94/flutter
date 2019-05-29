import 'package:flutter/material.dart';

import 'package:first_app/products.dart';
import 'package:first_app/product_control.dart';

class ProductManager extends StatefulWidget {

  final Map<String, String> startingProduct; // final cause its technically a seperated class. only state class below you can avoid final
  
  ProductManager({this.startingProduct});

  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {

  List<Map<String, String>> _products = [];

  @override
  void initState() {

    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct); // widget property is provided to flutter to access parent properties.
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  Widget build(BuildContext context) {
    return Column( children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(_addProduct)
      ),
      Expanded(child: Products(_products),)
     
    ]);
  }
}