import 'package:flutter/material.dart';

class Products extends StatelessWidget {

  final List<String> products; // final cause everything needs to be immutable since its a stateless widget.

  Products([this.products = const []]) {

  } // equivalent to assigning this.products to products in the constructor - short-hand

  Widget _buildProduct(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index])
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProduct,
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text('No Products found...start adding some!'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
} 
