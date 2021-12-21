import 'package:flutter/material.dart';
import 'package:full_shop_app/screens/feeds/category_feeds_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final AssetImage image;
  final String categoryName;

  CategoryItemWidget({
    required this.image,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CategoryFeedsScreen.routeName, arguments: categoryName);
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  image: DecorationImage(image: image, fit: BoxFit.fill)),
            ),
            Padding(
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 5),
            )
          ],
        ),
      ),
    );
  }
}
