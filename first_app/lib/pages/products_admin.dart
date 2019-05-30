import 'package:first_app/pages/product.dart';
import 'package:first_app/pages/product_create.dart';
import 'package:first_app/pages/product_list.dart';
import 'package:first_app/pages/products.dart';
import 'package:flutter/material.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:  2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: 
                      (BuildContext content) {
                        return ProductsPage();
                      }
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manager Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product'
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products'
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage()  
          ],
        )
      ),
    );
  }
}
