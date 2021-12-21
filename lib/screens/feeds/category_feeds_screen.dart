import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/products_provider.dart';
import 'package:provider/provider.dart';

import 'grid_products.dart';

class CategoryFeedsScreen extends StatelessWidget {
  static const routeName = "/category-feeds-screen";

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    final products = productsProvider.findByCategory(categoryName);
    return Scaffold(
      body: GridProducts(products),
    );
  }
}
