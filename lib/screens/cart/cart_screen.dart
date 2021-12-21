import 'package:flutter/material.dart';
import 'package:full_shop_app/screens/cart/cart_full.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartFull(),
    );
  }
}
