import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/cart_provider.dart';
import 'package:full_shop_app/provider/dark_theme_provider.dart';
import 'package:full_shop_app/provider/products_provider.dart';
import 'package:full_shop_app/provider/wishlist_provider.dart';
import 'package:full_shop_app/routes/app_routes.dart';
import 'package:full_shop_app/screens/login/landing_page.dart';
import 'package:provider/provider.dart';

import 'const/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DarkThemeProvider()),
          ChangeNotifierProvider(create: (context) => ProductsProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => WishListProvider()),
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, theme, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: Styles.themeData(theme.darkTheme, context),
              home: LandingPageScreen(),
              onGenerateRoute: AppRoutes.generateRoute,
            );
          },
        ));
  }
}
