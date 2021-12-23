import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/product_provider.dart';
import 'package:full_shop_app/provider/wishlist_provider.dart';
import 'package:full_shop_app/screens/wishlist/wishlist_empty.dart';
import 'package:full_shop_app/screens/wishlist/wishlist_full.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist-screen';

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return wishListProvider.items.isEmpty
        ? Scaffold(body: EmptyWishList())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist (${wishListProvider.items.length})'),
            ),
            body: ListView.builder(
              itemCount: wishListProvider.items.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ChangeNotifierProvider<Product>.value(
                  child: WishlistFull(),
                  value: wishListProvider.items.values.toList()[index],
                );
              },
            ),
          );
  }
}
