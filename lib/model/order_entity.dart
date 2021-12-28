import 'package:flutter/cupertino.dart';

class OrderEntity with ChangeNotifier {
  String userId;
  String orderId;
  Map<String, dynamic> products;
  String createdAt;
  double price;

  OrderEntity({
    required this.userId,
    required this.orderId,
    required this.products,
    required this.price,
    required this.createdAt,
  });
}
