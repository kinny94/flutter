import 'package:flutter/material.dart';

class Products extends StatelessWidget {

  final List<String> products; // final cause everything needs to be immutable since its a stateless widget.

  Products([this.products = const []]) {

  } // equivalent to assigning this.products to products in the constructor - short-hand

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.products
        .map(
          (element) => Card(
            child: Column(
              children: <Widget>[
                Image.asset('assets/food.jpg'),
                Text(element)
              ],
            ),
          ),
        ).toList(),
    );
  }
}
