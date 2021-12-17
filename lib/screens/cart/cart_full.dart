import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Cart Items",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.primary,
              )),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return CartItem();
          },
          itemCount: 5,
        ),
      ),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Order now"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Text("Grand Total",style: TextStyle(fontWeight: FontWeight.w500),),
          SizedBox(
            width: 4,
          ),
          Text("\$ 10000",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.secondary,),)
        ],
      ),
    );
  }
}
