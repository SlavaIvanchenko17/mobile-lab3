import 'package:flutter/material.dart';
import 'package:lab3_2/form.dart';
import 'package:provider/provider.dart';
import 'package:lab3_2/model.dart';

class Cart extends StatefulWidget {

  Cart();

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  _CartState();
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.cartsLen,
          itemBuilder: (context, index) {
            var item = cart.cartList[index];
            return FormProduct(item, cart.removeProduct, 'Cancel');
          }),
    );
  }
}