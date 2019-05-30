import 'package:first_app/pages/products_admin.dart';
import 'package:first_app/products.dart';
import 'package:flutter/material.dart';

import 'package:first_app/product_manager.dart';

class ProductsPage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose')
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: 
                  (BuildContext context) {
                    return ProductAdminPage();
                  }
                ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Easylist'),
      ),
      body: ProductManager()
    );
  }
}