import 'package:flutter/material.dart';
import 'package:full_shop_app/model/order_entity.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderEntity>(context);
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          // padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(order.products.values.toList()[0]['imageUrl']),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order code: ${order.orderId.substring(0,5)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Price'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '\$ ${order.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
