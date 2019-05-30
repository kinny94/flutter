import 'package:flutter/material.dart';

import 'package:first_app/products.dart';

class ProductManager extends StatelessWidget {

  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  Widget build(BuildContext context) {
    return Column( children: [
      Expanded(child: Products(products))
    ]);
  }
}