import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_shop_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'feed_product.dart';

class GridProducts extends StatelessWidget {
  final List<Product> products;

  GridProducts(this.products);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) =>
          ChangeNotifierProvider.value(
        value: products[index],
        child: FeedProduct(
          key: ValueKey(products[index].id),
        ),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}
