import 'package:flutter/cupertino.dart';

class CartItemEntity with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final String imageUrl;
  final double price;

  CartItemEntity({
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageUrl,
    required this.price,
  });
}
