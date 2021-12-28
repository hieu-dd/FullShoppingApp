import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:full_shop_app/model/order_entity.dart';
import 'package:full_shop_app/provider/cart_provider.dart';
import 'package:uuid/uuid.dart';

class OrdersProvider with ChangeNotifier {
  List<OrderEntity> _orders = [];

  List<OrderEntity> get orders => [..._orders];

  Future<void> checkout(CartProvider cart) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final orderId = const Uuid().v4();
    await firestore.collection("orders").doc(orderId).set({
      'userId': auth.currentUser!.uid,
      'orderId': orderId,
      'products': cart.cartItems.map((key, value) => MapEntry(key, {
            'quantity': value.quantity,
            'imageUrl': value.imageUrl,
          })),
      'price': cart.totalAmount,
      'createdAt': Timestamp.now()
    });
  }

  Future<void> fetchOrders() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final col = await firestore
        .collection("orders")
        .where("userId", isEqualTo: auth.currentUser!.uid)
        .get();
    _orders.clear();

    col.docs.forEach((element) {
      final Timestamp createAt = element['createdAt'];
      // var format = DateFormat.yMd('ar');
      // var dateString = format.format(createAt.toDate());
      final products = new Map<String, dynamic>.from(element['products']);
      _orders.add(OrderEntity(
        userId: element['userId'],
        orderId: element['orderId'],
        products: products,
        price: element['price'],
        createdAt: createAt.toString(),
      ));
    });

    _orders;

    notifyListeners();
  }
}
