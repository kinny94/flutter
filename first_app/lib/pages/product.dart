import 'dart:async';

import 'package:first_app/models/product.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {

  final int index;

  ProductPage(this.index);

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Union Sqaure San Francisco', style: TextStyle(fontFamily: 'Oswald', color: Colors.grey)),
        Container(margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text('|', style: TextStyle(color: Colors.grey)),
        ),
        Text('\$${price.toString()}', style: TextStyle(fontFamily: 'Oswald', color: Colors.grey))
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
          final Product product = model.products[index]; 
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(product.image),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title) 
                ),
                _buildAddressPriceRow(product.price),
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(product.description, textAlign: TextAlign.justify),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
