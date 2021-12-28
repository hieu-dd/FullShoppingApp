import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/orders_provider.dart';
import 'package:full_shop_app/screens/orders/order_full.dart';
import 'package:provider/provider.dart';

import 'empty_order_screen.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders-screen";

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context,listen: false);
    return FutureBuilder(
      future: ordersProvider.fetchOrders(),
      builder: (context, snapshot) {
        return Scaffold(
          body: snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ordersProvider.orders.isEmpty
                  ? EmptyOrderScreen()
                  : OrderFull(),
        );
      },
    );
  }
}
