import 'package:flutter/material.dart';
import 'package:full_shop_app/const/data.dart';

class PopularProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: NetworkImage(product_image),
                    fit: BoxFit.cover,
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
            child: Text("Title"),
            padding: EdgeInsets.all(5),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Description"),
                // Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
