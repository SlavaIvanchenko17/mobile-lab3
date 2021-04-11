import 'package:flutter/material.dart';
import 'package:lab3_2/product.dart';

class CartModel extends ChangeNotifier {
  List<Product> _cartList = [];
  List<Product> get cartList => _cartList;
  int get cartsLen => this._cartList.length;

  void addProduct(Product p) {
    _cartList.add(p);
    notifyListeners();
  }
  
  void removeProduct(Product p) {
    _cartList.remove(p);
    notifyListeners();
  }
}