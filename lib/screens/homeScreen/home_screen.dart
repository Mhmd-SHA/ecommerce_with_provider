import 'package:ecommerce_with_provider/models/product_model.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/components/image_slider.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/components/product_category.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/components/search_field.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/components/special_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<Product>> products = [
    allProducts,
    shoes,
    beauty,
    womenFashion,
    jewelry,
    menFashion
  ];

  int selectedList = 0;

  void changeSelectedList(int index) {
    setState(() {
      selectedList = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          iconSize: 15,
          style: IconButton.styleFrom(
              backgroundColor: CupertinoColors.secondarySystemFill),
          onPressed: () {},
          icon: ImageIcon(
            AssetImage("images/icon.png"),
            color: CupertinoColors.darkBackgroundGray,
          ),
        ),
        actions: [
          IconButton(
              iconSize: 20,
              style: IconButton.styleFrom(
                  backgroundColor: CupertinoColors.secondarySystemFill),
              onPressed: () {},
              icon: Icon(IconlyBroken.notification))
        ],
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            50,
          ),
          child: SearchField(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ImageSlider(),
              ProductCategory(
                selectedIndex: selectedList,
                ontap: changeSelectedList,
              ),
              SpecialProducts(
                products: products[selectedList],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
