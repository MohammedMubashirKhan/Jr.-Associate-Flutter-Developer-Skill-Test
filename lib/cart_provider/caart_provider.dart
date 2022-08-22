import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<String> title = [];

  List<String> get getCart => title;

  void addToCart(String name) {
    title.add(name);
    print(title);
    notifyListeners();
  }

  void deleteFromCart(String name) {
    title.remove(name);
    notifyListeners();
  }
}
