import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/product_provider.dart';
import 'package:full_shop_app/screens/product_detail/product_details.dart';
import 'package:provider/provider.dart';

class PopularProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetails.routeName,
          arguments: product.id,
        );
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.star_border,
                    size: 20,
                    color: Colors.purple,
                  ),
                )
              ],
            ),
            Padding(
              child: Text(
                product.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              padding: const EdgeInsets.all(5),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
