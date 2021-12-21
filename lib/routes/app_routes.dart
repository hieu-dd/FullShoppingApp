import 'package:flutter/material.dart';
import 'package:full_shop_app/screens/bottom_bar.dart';
import 'package:full_shop_app/screens/cart/cart_screen.dart';
import 'package:full_shop_app/screens/feeds/feeds_screen.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BottomBarScreen.routeName:
        return MaterialPageRoute(builder: (_) => BottomBarScreen());
      case FeedsScreen.routeName:
        return MaterialPageRoute(builder: (_) => FeedsScreen());
      case CartScreen.routeName:
        return MaterialPageRoute(builder: (_) => CartScreen());
      default:
        return null;
    }
  }
}
