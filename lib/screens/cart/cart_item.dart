import 'package:flutter/material.dart';
import 'package:full_shop_app/const/colors.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          // padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://lh3.googleusercontent.com/U5eymwOqCTkRlUVddqVwi1dbMBRIQwx1e9b40i3D1tqNZK_mtWTpwlN8eBC_Mjd_7jpoBuAwbtwRahgm1pQ"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: const Text(
                            "Title",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.close),
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Price'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '\$ 450',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Sub total'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '\$ 450',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Ships free",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.remove)),
                        ),
                        Card(
                          elevation: 5,
                          child: Container(
                            width: 40,
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ColorsConsts.gradiendFStart,
                                  ColorsConsts.gradiendFEnd
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                            child: Text(
                              "2",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Theme.of(context).colorScheme.secondary,
                          child: Container(
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: const Icon(Icons.add)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
