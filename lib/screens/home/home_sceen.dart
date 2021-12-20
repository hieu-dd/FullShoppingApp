import 'package:backdrop/backdrop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:full_shop_app/const/colors.dart';
import 'package:full_shop_app/const/data.dart';
import 'package:full_shop_app/screens/home/category_item_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _carouselImages = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png"
  ];

  final _brandImages = [
    "assets/images/addidas.jpg",
    "assets/images/apple.jpg",
    "assets/images/dell.jpg",
    "assets/images/h&m.jpg",
    "assets/images/nike.jpg",
    "assets/images/samsung.jpg",
    "assets/images/huawei.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: _buildAppbar(context),
      backLayer: Center(
        child: Text("Back Layer"),
      ),
      frontLayer: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarousels(context),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Categories",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return CategoryItemWidget(
                    image: AssetImage("assets/images/CatPhones.jpg"),
                    categoryName: "Phones",
                  );
                },
                itemCount: 7,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "Popular brands",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            _buildPopularBrands(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return BackdropAppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorsConsts.starterColor, ColorsConsts.endColor]),
        ),
      ),
      title: Text("Home"),
      actions: [
        IconButton(
            iconSize: 15,
            onPressed: () {},
            icon: CircleAvatar(
              backgroundImage: NetworkImage(user_avatar),
            ))
      ],
    );
  }

  Widget _buildCarousels(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: _carouselImages.length,
        itemBuilder: (context, index, realIndex) {
          return SizedBox(
            width: double.infinity,
            child: Image.asset(
              _carouselImages[index],
              fit: BoxFit.fitWidth,
            ),
          );
        },
        options: CarouselOptions(
          height: 190,
          // aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget _buildPopularBrands() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: CarouselSlider.builder(
        itemCount: _brandImages.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(_brandImages[index]),
                fit: BoxFit.fill,
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
          );
        },
        options: CarouselOptions(
          height: 210,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
