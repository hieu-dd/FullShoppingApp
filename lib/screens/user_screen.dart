import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var _useDartTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: userTitle("User Information"),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          userListTile(
            "Email",
            "hieu.dd@teko.vn",
            Icons.email,
          ),
          userListTile(
            "Phone",
            "0943310394",
            Icons.phone,
          ),
          userListTile(
            "Shipping address",
            "16/91 Gang Thep Street",
            Icons.local_shipping,
          ),
          userListTile(
            "Joined date",
            "31/03/1994",
            Icons.date_range,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: userTitle("User Information"),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTileSwitch(
            value: _useDartTheme,
            leading: const Icon(Icons.dark_mode),
            onChanged: (value) {
              setState(() {
                _useDartTheme = value;
              });
            },
            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.material,
            switchActiveColor: Theme.of(context).primaryColor,
            title: const Text('Use dark theme'),
          ),
        ],
      ),
    );
  }
}

Widget userTitle(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
}

Widget userListTile(
  String title,
  String subtitle,
  IconData iconData,
) {
  return Material(
    color: Colors.transparent,
    child: ListTile(
      leading: Icon(iconData),
      title: Text(title),
      subtitle: Text(subtitle),
    ),
  );
}
