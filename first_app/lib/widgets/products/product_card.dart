import 'package:first_app/widgets/products/address_tag.dart';
import 'package:first_app/widgets/products/price_tag.dart';
import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(this.product['imageUrl']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: TitleDefault(product['title'])
                ),
                SizedBox(width: 8.0),
                PriceTag(this.product['price'].toString())
              ]
            )
          ),
          AddressTag('Union Square, San Francisco'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => {
                  Navigator.pushNamed<bool>(context, '/product/' + this.productIndex.toString())
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => {
                  Navigator.pushNamed<bool>(context, '/product/' + this.productIndex.toString())
                },
              )
            ],
          )
        ],
      ),
    );;
  }
}