import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/cart_provider.dart';
import 'package:full_shop_app/screens/cart/cart_full.dart';
import 'package:provider/provider.dart';

import 'empty_cart_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: cartProvider.cartItems.isEmpty ? EmptyCartScreen() : CartFull(),
    );
  }
}
