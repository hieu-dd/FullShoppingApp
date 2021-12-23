import 'package:flutter/material.dart';
import 'package:full_shop_app/const/my_app_icons.dart';
import 'package:full_shop_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

class FeedProductDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Dialog(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAction("Wish list", MyAppIcons.wishlist, () {}),
                    _buildAction("View detail", Icons.remove_red_eye_outlined, () {}),
                    _buildAction("Add to cart", MyAppIcons.cart, () {}),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAction(String title, IconData icon, Function fct) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset.fromDirection(-10.0))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Icon(
                icon
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
