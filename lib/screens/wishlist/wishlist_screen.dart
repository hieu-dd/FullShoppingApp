import 'package:flutter/material.dart';
import 'package:full_shop_app/screens/wishlist/wishlist_empty.dart';
import 'package:full_shop_app/screens/wishlist/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist-screen';

  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
        ? Scaffold(body: EmptyWishList())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist ()'),
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext ctx, int index) {
                return WishlistFull();
              },
            ),
          );
  }
}
