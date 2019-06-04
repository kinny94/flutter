import 'package:flutter/material.dart';


class ProductEditPage extends StatefulWidget {

  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;

  ProductEditPage({this.addProduct, this.updateProduct, this.product});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {

  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'imageUrl': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      validator: (String value) {
        if (value.isEmpty && value.length < 5) {
          return 'Title is required and should be 5+ characters long';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildProductDescriptionTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty && value.length < 10) {
          return 'Title is required and should be 5+ characters long';
        }
      },
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildProductPriceTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty && RegExp(r'^(?:[1-9]\d*|0)?(?:[.,]\d+)?$') .hasMatch(value)) {
          return 'Price is required and should be 5+ characters long';
        }
      },
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] =  double.parse(value.replaceFirst(RegExp(r','), '.'));
      },
    );
  }

  _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }
   
  @override
  Widget build(BuildContext context) {  

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding/2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildProductDescriptionTextField(),
            _buildProductPriceTextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Save'),
              textColor: Colors.white,
              onPressed: _submitForm,
            )
          ],
        ), 
        ),
      ),
    );
  }
}