import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/product_provider.dart';
import 'package:full_shop_app/screens/feeds/feed_product_dialog.dart';
import 'package:provider/provider.dart';

class FeedProduct extends StatelessWidget {
  FeedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    void _showDialog() {
      showDialog(
          context: context,
          builder: (ctx) {
            return ChangeNotifierProvider.value(
              value: product,
              child: FeedProductDialog(),
            );
          });
    }

    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: 250,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.deepPurple,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                    ),
                    badgeContent: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                height: 0.5,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.description),
                    Text(
                      "\$ ${product.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Quantity: ${product.quantity}"),
                        InkWell(
                          onTap: _showDialog,
                          child: Icon(Icons.more_horiz),
                        )
                      ],
                    ),
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
