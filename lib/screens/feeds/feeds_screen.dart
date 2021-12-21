import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_shop_app/screens/feeds/feed_product.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = "/feeds-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => FeedProduct(index),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
