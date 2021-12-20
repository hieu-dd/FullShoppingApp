import 'package:backdrop/backdrop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:full_shop_app/const/colors.dart';
import 'package:full_shop_app/const/data.dart';
import 'package:full_shop_app/screens/home/category_item_widget.dart';
import 'package:full_shop_app/screens/home/popular_product_item_widget.dart';

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

  final List<Map<String, Object>> _categories = [
    {'title': 'Beauty', 'imageAssest': 'assets/images/CatBeauty.jpg'},
    {'title': 'Clothes', 'imageAssest': 'assets/images/CatClothes.jpg'},
    {'title': 'Furniture', 'imageAssest': 'assets/images/CatFurniture.jpg'},
    {'title': 'Laptops', 'imageAssest': 'assets/images/CatLaptops.png'},
    {'title': 'Phones', 'imageAssest': 'assets/images/CatPhones.png'},
    {'title': 'Shoes', 'imageAssest': 'assets/images/CatShoes.jpg'},
    {'title': 'Watches', 'imageAssest': 'assets/images/CatWatches.jpg'},
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
            _buildTitle(
              title: "Categories",
            ),
            Container(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return CategoryItemWidget(
                    image: AssetImage(
                      _categories[index]["imageAssest"] as String,
                    ),
                    categoryName: _categories[index]["title"] as String,
                  );
                },
                itemCount: _categories.length,
              ),
            ),
            _buildTitle(
              title: "Popular brands",
              textAction: "See all",
            ),
            _buildPopularBrands(),
            _buildTitle(
              title: "Popular products",
              textAction: "See all",
            ),
            Container(
              height: 251,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return PopularProductItemWidget();
                },
                itemCount: _categories.length,
              ),
            ),
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

  Widget _buildTitle({required String title, String? textAction}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          textAction != null
              ? Text(
                  textAction,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
