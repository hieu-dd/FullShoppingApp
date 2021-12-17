import 'package:flutter/material.dart';
import 'package:full_shop_app/const/colors.dart';

class EmptyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: const Image(
            image: AssetImage("assets/images/emptycart.png"),
          ),
        ),
        Text(
          'Your Cart Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Looks Like You didn\'t \n add anything to your cart yet',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorsConsts.subTitle,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 60,
          ),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            )),
            onPressed: () {},
            child: Text(
              'shop now'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
