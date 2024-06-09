import 'package:ecommerce_with_provider/screens/favouriteScreen/fav_tile.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/productDetailsScreen/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';
import '../cartScreen/components/cart_tile.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, Provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: Color(0xffF5F5F5),
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            forceMaterialTransparency: true,
            centerTitle: true,
            title: Text(
              "My Favourites",
              style: TextStyle(
                color: CupertinoColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: Provider.favourites.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                            product: Provider.favourites[index]));
                      },
                      child: FavTile(
                          product: Provider.favourites[index], index: index),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
