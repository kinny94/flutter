import 'package:first_app/pages/product.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  
  final List<Map<String, String>> products; // final cause everything needs to be immutable since its a stateless widget.
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct} ); // equivalent to assigning this.products to products in the constructor - short-hand

  Widget _buildProduct(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => {
                  Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductPage(products[index]['title'], products[index]['imageUrl'])
                    )
                  ).then((bool value) {
                    if (value) {
                      this.deleteProduct(index);
                    }
                  })
                },
              )
            ],
          )
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
      productCard =
          Center(child: Text('No Products found...start adding some!'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
