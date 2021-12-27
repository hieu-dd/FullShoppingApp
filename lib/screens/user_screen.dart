import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_shop_app/const/data.dart';
import 'package:full_shop_app/const/my_app_icons.dart';
import 'package:full_shop_app/provider/dark_theme_provider.dart';
import 'package:full_shop_app/screens/wishlist/wishlist_screen.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

import 'cart/cart_screen.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late ScrollController _scrollController;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.deepPurple,
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            height: kToolbarHeight / 2,
                            width: kToolbarHeight / 2,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1.0,
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(user_avatar),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text("14H"),
                        ],
                      ),
                      background: const Image(
                        image: NetworkImage(
                            "https://scontent.fhph1-2.fna.fbcdn.net/v/t1.6435-9/119524184_3030131393880758_3961479534331280604_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=e3f864&_nc_ohc=VfeNBfab5l4AX-46Ccz&_nc_ht=scontent.fhph1-2.fna&oh=00_AT8EJt2yNN14y0CHKCFtTXY2FUL3jMwj349i3f-W4z29gA&oe=61E282E1"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      userTitle("User Bag"),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(WishlistScreen.routeName);
                        },
                        leading: Icon(MyAppIcons.wishlist),
                        title: Text("Wish list"),
                        trailing: Icon(Icons.chevron_right_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        leading: Icon(MyAppIcons.cart),
                        title: Text("Cart"),
                        trailing: Icon(Icons.chevron_right_outlined),
                      ),
                      userTitle("User Information"),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      userListTile(
                        title: "Email",
                        subtitle: "hieu.dd@teko.vn",
                        iconData: Icons.email,
                      ),
                      userListTile(
                        title: "Phone",
                        subtitle: "0943310394",
                        iconData: Icons.phone,
                      ),
                      userListTile(
                        title: "Shipping address",
                        subtitle: "16/91 Gang Thep Street",
                        iconData: Icons.local_shipping,
                      ),
                      userListTile(
                        title: "Joined date",
                        subtitle: "31/03/1994",
                        iconData: Icons.date_range,
                      ),
                      userTitle("User settings"),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      ListTileSwitch(
                        value: darkThemeProvider.darkTheme,
                        leading: const Icon(Icons.dark_mode),
                        onChanged: (value) {
                          setState(() {
                            darkThemeProvider.darkTheme = value;
                          });
                        },
                        visualDensity: VisualDensity.comfortable,
                        switchType: SwitchType.material,
                        switchActiveColor: Colors.indigo,
                        title: const Text('Use dark theme'),
                      ),
                      userListTile(
                        title: "Logout",
                        iconData: Icons.logout_outlined,
                        fct: (){
                          _auth.signOut();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildFab(),
          ],
        ),
      ),
    );
  }

  Widget _buildFab() {
    const defaultTop = 175.0;
    const scaleStart = 160.0;
    const scaleEnd = scaleStart / 2;
    var top = defaultTop;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      var offset = _scrollController.offset;
      top -= offset;
      if (top >= scaleStart) {
        scale = 1.0;
      } else if (top >= scaleEnd) {
        scale = (top - scaleEnd) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
        top: top,
        right: 16,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              child: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
              backgroundColor: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
        ));
  }
}

Widget userTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Widget userListTile({
  required String title,
  String? subtitle,
  required IconData iconData,
  Function? fct,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        fct?.call();
      },
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
      ),
    ),
  );
}
