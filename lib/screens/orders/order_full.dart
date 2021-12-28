import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/orders_provider.dart';
import 'package:provider/provider.dart';

import 'order_item.dart';

class OrderFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
          },
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Order (${ordersProvider.orders.length})",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider.value(
              value: ordersProvider.orders[index],
              child: OrderItem(),
            );
          },
          itemCount: ordersProvider.orders.length,
        ),
      ),
    );
  }
}
