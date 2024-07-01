import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_model.dart';

class CartProvider extends InheritedWidget {
  final Cart cart;

  const CartProvider({super.key, required super.child, required this.cart});

  @override
  bool updateShouldNotify(covariant CartProvider oldWidget) {
    return oldWidget.cart != cart;
  }

  static CartProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartProvider>();
  }
}
