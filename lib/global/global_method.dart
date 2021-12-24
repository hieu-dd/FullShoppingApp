import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalMethod {
  static void showAlertDialog(
      String title, String subtitle, Function fct, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Cancel".toUpperCase()),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  fct();
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }
}