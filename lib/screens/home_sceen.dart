import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Title"),
            pinned: true,
            backgroundColor: Colors.red,
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Text("Hello"),
              childCount: 50,
            ),
          )
        ],
      ),
    );
  }
}
