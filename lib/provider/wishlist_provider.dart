import 'package:flutter/cupertino.dart';
import 'package:full_shop_app/provider/product_provider.dart';

class WishListProvider with ChangeNotifier {
  Map<String, Product> _items = {};

  Map<String, Product> get items => {..._items};

  void toggleWishProduct(Product product) {
    if (_items.containsKey(product.id)) {
      _items.remove(product.id);
    } else {
      _items.putIfAbsent(product.id, () => product);
    }
    notifyListeners();
  }

  bool hasProduct(Product product) => _items.containsKey(product.id);
}
