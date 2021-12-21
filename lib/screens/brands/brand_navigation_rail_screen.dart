import 'package:flutter/material.dart';
import 'package:full_shop_app/const/data.dart';
import 'package:full_shop_app/provider/products_provider.dart';
import 'package:provider/provider.dart';

import 'brands_rail_widget.dart';

class BrandsScreen extends StatefulWidget {
  static const routeName = '/brands-screen';

  @override
  _BrandsScreenState createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  var _selectBrandIndex = 0;

  void _setSelectBrand(int index) {
    setState(() {
      _selectBrandIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    final productBrands = productsProvider.products;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRail(
            destinations: brands
                .map(
                  (e) => _buildBrandDestination(e['label'] as String),
                )
                .toList(),
            selectedIndex: _selectBrandIndex,
            onDestinationSelected: _setSelectBrand,
            labelType: NavigationRailLabelType.all,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: productBrands.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ChangeNotifierProvider.value(
                          value: productBrands[index],
                          child: BrandsNavigationRail()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  NavigationRailDestination _buildBrandDestination(String brand) {
    return NavigationRailDestination(
      icon: SizedBox.shrink(),
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(brand),
        ),
      ),
    );
  }
}
