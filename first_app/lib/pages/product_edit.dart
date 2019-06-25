import 'package:first_app/models/product.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:first_app/widgets/helpers/ensure-visible.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class ProductEditPage extends StatefulWidget {

  final Function addProduct;
  final Function updateProduct;
  final Product product;
  final int productIndex;

  ProductEditPage({this.addProduct, this.updateProduct, this.product, this.productIndex});

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
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        initialValue: widget.product == null ? '' : widget.product.title,
        decoration: InputDecoration(labelText: 'Product Title'),
        validator: (String value) {
          if (value.isEmpty && value.length < 5) {
            return 'Title is required and should be 5+ characters long';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      )      
    );
  }

  Widget _buildProductDescriptionTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        initialValue: widget.product == null ? '' : widget.product.description,
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
      )
    );
  }

  Widget _buildProductPriceTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        focusNode: _priceFocusNode,
        initialValue: widget.product == null ? '' : widget.product.price.toString(),
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
      )
    );
  }

  _submitForm(Function addProduct, Function updateProduct) {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    if (widget.updateProduct == null) {
      addProduct(Product(
        title: _formData['title'],
        description: _formData['description'],
        price: _formData['price'],
        image: _formData['image']
      ));
    } else {
      updateProduct(widget.productIndex, _formData);
    }
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return RaisedButton(
          color: Theme.of(context).accentColor, 
          child: Text('Save'),
          textColor: Colors.white,
          onPressed: () => _submitForm(model.addProduct, model.updateProduct),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context) {

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
            _buildSubmitButton()
          ],
        ), 
        ),
      ),
    );
  }
   
  @override
  Widget build(BuildContext context) {  

    final Widget pageContent = _buildPageContent(context);
    return widget.product == null ? pageContent : Scaffold(appBar: AppBar(title: Text('Edit Product')), body: pageContent);
  }
}