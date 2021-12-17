import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            color: Colors.white,
            width: 250,
            child: Column(
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
                      Text("Description"),
                      Text(
                        "\$ 999",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
