import 'package:flutter/material.dart';
import 'package:full_shop_app/provider/dark_theme_provider.dart';
import 'package:full_shop_app/screens/bottom_bar.dart';
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
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, theme, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: Styles.themeData(theme.darkTheme, context),
              home: BottomBarScreen(),
            );
          },
        ));
  }
}
