import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {

  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Are you sure?'),
          content: Text('This action cannot be undone!'),
          actions: <Widget>[
            FlatButton(
              child: Text('DISCARD'),
              onPressed: () {
                Navigator.pop(context); // this will only close the alert dialog
              },
            ),
            FlatButton(
              child: Text('CONTINUE'),
              onPressed: () {
                Navigator.pop(context); // this will close the alert
                Navigator.pop(context, true); // this will navigate to the next page
              },
            )
          ],
        );
      }
    );
  }

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
              child: Text('Details'), 
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Delete'),
                onPressed: () {
                  return this._showWarningDialog(context);
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
