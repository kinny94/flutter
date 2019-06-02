import 'dart:async';

import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {

  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(this.imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(title) 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Union Sqaure San Francisco', style: TextStyle(fontFamily: 'Oswald', color: Colors.grey)),
                Container(margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('|', style: TextStyle(color: Colors.grey)),
                ),
                Text('\$${price.toString()}', style: TextStyle(fontFamily: 'Oswald', color: Colors.grey))
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(this.description, textAlign: TextAlign.justify),
            )
          ],
        ),
      ),
    );
  }
}
