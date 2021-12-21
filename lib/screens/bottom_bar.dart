import 'package:flutter/material.dart';
import 'package:full_shop_app/const/my_app_icons.dart';
import 'package:full_shop_app/screens/cart/cart_screen.dart';
import 'package:full_shop_app/screens/feeds/feeds_screen.dart';
import 'package:full_shop_app/screens/home/home_sceen.dart';
import 'package:full_shop_app/screens/search_screen.dart';
import 'package:full_shop_app/screens/user_screen.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home screen',
      },
      {
        'page': FeedsScreen(),
        'title': 'Feeds screen',
      },
      {
        'page': SearchScreen(),
        'title': 'Search screen',
      },
      {
        'page': CartScreen(),
        'title': 'Cart screen',
      },
      {
        'page': UserScreen(),
        'title': 'User screen',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_selectedPageIndex];
    return Scaffold(
      body: page['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          selectedItemColor: Theme.of(context).colorScheme.primaryVariant,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(MyAppIcons.home),
              tooltip: 'Home',
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyAppIcons.rss),
              tooltip: 'Feeds',
              label: 'Feeds',
            ),
            const BottomNavigationBarItem(
              activeIcon: null,
              icon: Icon(null),
              tooltip: 'Search',
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyAppIcons.cart),
              tooltip: 'Cart',
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyAppIcons.user),
              tooltip: 'Home',
              label: 'Home',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          _selectPage(2);
        },
      ),
    );
  }
}
