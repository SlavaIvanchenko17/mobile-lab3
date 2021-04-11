import 'package:flutter/material.dart';
import 'package:lab3_1/form.dart';
import 'package:lab3_1/product.dart';

class Cart extends StatefulWidget {
  final List<Product> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Product> _cart;

  void _removeProduct(i) {
    setState(() {
      _cart.remove(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var _item = _cart[index];
            return FormProduct(_item, _removeProduct, 'Cancel');
          }),
    );
  }
}