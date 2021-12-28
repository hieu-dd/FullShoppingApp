import 'package:flutter/material.dart';
import 'package:full_shop_app/screens/auth/login.dart';
import 'package:full_shop_app/screens/auth/sign_up.dart';
import 'package:full_shop_app/screens/bottom_bar.dart';
import 'package:full_shop_app/screens/brands/brand_navigation_rail_screen.dart';
import 'package:full_shop_app/screens/cart/cart_screen.dart';
import 'package:full_shop_app/screens/feeds/category_feeds_screen.dart';
import 'package:full_shop_app/screens/feeds/feeds_screen.dart';
import 'package:full_shop_app/screens/orders/order_screen.dart';
import 'package:full_shop_app/screens/product_detail/product_details.dart';
import 'package:full_shop_app/screens/upload/upload_product_form.dart';
import 'package:full_shop_app/screens/wishlist/wishlist_screen.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BottomBarScreen.routeName:
        return MaterialPageRoute(builder: (_) => BottomBarScreen());
      case FeedsScreen.routeName:
        return MaterialPageRoute(builder: (_) => FeedsScreen());
      case CartScreen.routeName:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case OrderScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OrderScreen(),
          settings: settings,
        );
      case WishlistScreen.routeName:
        return MaterialPageRoute(builder: (_) => WishlistScreen());
      case CategoryFeedsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CategoryFeedsScreen(),
          settings: settings,
        );
      case ProductDetails.routeName:
        return MaterialPageRoute(
          builder: (_) => ProductDetails(),
          settings: settings,
        );
      case BrandsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BrandsScreen(),
          settings: settings,
        );
      case UploadProductForm.routeName:
        return MaterialPageRoute(
          builder: (_) => UploadProductForm(),
          settings: settings,
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
