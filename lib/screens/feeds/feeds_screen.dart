import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_shop_app/provider/products_provider.dart';
import 'package:full_shop_app/screens/feeds/feed_product.dart';
import 'package:full_shop_app/screens/feeds/grid_products.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = "/feeds-screen";

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).products;
    return Scaffold(
      body: GridProducts(products),
    );
  }
}
