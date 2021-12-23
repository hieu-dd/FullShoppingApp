import 'package:flutter/cupertino.dart';
import 'package:full_shop_app/model/cart_entity.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItemEntity> _cartItems = {};

  Map<String, CartItemEntity> get cartItems => {..._cartItems};

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  void addProductToCart(
      String productId, String title, double price, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => CartItemEntity(
            id: value.id,
            title: title,
            quantity: value.quantity + 1,
            imageUrl: imageUrl,
            price: price),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItemEntity(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            imageUrl: imageUrl,
            price: price),
      );
    }
  }

  void updateProduct(String productId, int quantity) {
    _cartItems.update(
      productId,
      (value) => CartItemEntity(
          id: value.id,
          title: value.title,
          quantity: quantity,
          imageUrl: value.imageUrl,
          price: value.price),
    );
    notifyListeners();
  }

  void deleteProduct(String productId){
    _cartItems.remove(productId);
    notifyListeners();
  }
}
