import 'package:flutter/material.dart';
import 'package:full_shop_app/model/cart_entity.dart';
import 'package:full_shop_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Cart (${cartProvider.cartItems.length})",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider<CartItemEntity>.value(
              value: cartProvider.cartItems.values.toList()[index],
              child: CartItem(
                productId: cartProvider.cartItems.keys.toList()[index],
              ),
            );
          },
          itemCount: cartProvider.cartItems.length,
        ),
      ),
      bottomSheet: _buildBottomSheet(context, cartProvider.totalAmount),
    );
  }

  Widget _buildBottomSheet(BuildContext context, double grandTotal) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Order now"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            "Grand Total",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "\$ ${grandTotal}",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        ],
      ),
    );
  }
}
