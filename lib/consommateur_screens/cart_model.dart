import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems => _items.length;

  double get totalPrice => _items.fold(0.0, (total, current) => total + current.price * current.quantity);

  void addItem(String name, double price, int quantity) {
    _items.add(CartItem(name, price, quantity));
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateItemQuantity(CartItem item, int quantity) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem(this.name, this.price, this.quantity);
}
