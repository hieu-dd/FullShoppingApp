import 'package:flutter/material.dart';
import 'package:full_shop_app/const/colors.dart';
import 'package:full_shop_app/const/data.dart';
import 'package:full_shop_app/const/my_app_icons.dart';
import 'package:full_shop_app/screens/cart/cart_screen.dart';
import 'package:full_shop_app/screens/feeds/feeds_screen.dart';
import 'package:full_shop_app/screens/wishlist/wishlist_screen.dart';

class BackLayerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._backgrounds(context),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 50),
          child: _content(context),
        )
      ],
    );
  }

  void navigateTo(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(
      routeName,
    );
  }

  List<Widget> _backgrounds(BuildContext context) {
    return [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorsConsts.starterColor, ColorsConsts.endColor],
          ),
        ),
      ),
      Positioned(
        top: -100.0,
        left: 140.0,
        child: Transform.rotate(
          angle: -0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white.withOpacity(0.3),
            ),
            width: 150,
            height: 250,
          ),
        ),
      ),
      Positioned(
        bottom: 0.0,
        right: 100.0,
        child: Transform.rotate(
          angle: -0.8,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white.withOpacity(0.3),
            ),
            width: 150,
            height: 300,
          ),
        ),
      ),
      Positioned(
        top: -50.0,
        left: 60.0,
        child: Transform.rotate(
          angle: -0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white.withOpacity(0.3),
            ),
            width: 150,
            height: 200,
          ),
        ),
      ),
      Positioned(
        bottom: 10.0,
        right: 0.0,
        child: Transform.rotate(
          angle: -0.8,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white.withOpacity(0.3),
            ),
            width: 150,
            height: 200,
          ),
        ),
      ),
    ];
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(user_avatar),
                  fit: BoxFit.fill,
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _contentItem(
          context,
          () {
            navigateTo(context, FeedsScreen.routeName);
          },
          'Feeds',
          MyAppIcons.rss,
        ),
        const SizedBox(height: 10.0),
        _contentItem(
          context,
          () {
            navigateTo(context, CartScreen.routeName);
          },
          'Cart',
          MyAppIcons.cart,
        ),
        const SizedBox(height: 10.0),
        _contentItem(
          context,
          () {
            navigateTo(context, WishlistScreen.routeName);
          },
          'Wishlist',
          MyAppIcons.wishlist,
        ),
        const SizedBox(height: 10.0),
        _contentItem(
          context,
          () {
            navigateTo(context, FeedsScreen.routeName);
          },
          'Upload a new product',
          MyAppIcons.upload,
        ),
      ],
    );
  }

  Widget _contentItem(
      BuildContext ctx, Function fct, String text, IconData icon) {
    return InkWell(
      onTap: () {
        fct.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(icon)
        ],
      ),
    );
  }
}
