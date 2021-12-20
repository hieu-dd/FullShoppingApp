import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FeedProduct extends StatelessWidget {
  final int index;

  FeedProduct(this.index);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Colors.white,
          width: 250,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      minHeight: 150,
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://lh3.googleusercontent.com/U5eymwOqCTkRlUVddqVwi1dbMBRIQwx1e9b40i3D1tqNZK_mtWTpwlN8eBC_Mjd_7jpoBuAwbtwRahgm1pQ",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.deepPurple,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                    ),
                    badgeContent: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                height: 0.5,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description $index"),
                    Text(
                      "\$ 999",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Quantity: 10"),
                        InkWell(
                          child: Icon(Icons.more_horiz),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              index % 3 != 1 ? Text("HIhi") : SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
