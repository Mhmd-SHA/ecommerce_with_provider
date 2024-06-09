import 'package:ecommerce_with_provider/models/product_model.dart';
import 'package:ecommerce_with_provider/provider/data_provider.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/productDetailsScreen/components/add_to_cart.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/productDetailsScreen/components/product_details.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/productDetailsScreen/components/product_iamge_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product product;
  ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<DataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      backgroundColor: Color(0xffF5F5F5),
      extendBodyBehindAppBar: true,
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSlider(product: widget.product),
            ProductDetails(product: widget.product),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddToCart(
        product: widget.product,
      ),
    );
  }

  AppBar appbar() => AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          iconSize: 15,
          style: IconButton.styleFrom(backgroundColor: CupertinoColors.white),
          onPressed: () {
            Get.back();
          },
          icon: Icon(IconlyBroken.arrowLeft2),
        ),
        actions: [
          IconButton(
            iconSize: 20,
            style: IconButton.styleFrom(backgroundColor: CupertinoColors.white),
            onPressed: () {},
            icon: Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
          ),
          Consumer<DataProvider>(
            builder: (context, pro, child) {
              return IconButton(
                iconSize: 20,
                style: IconButton.styleFrom(
                    backgroundColor: CupertinoColors.white),
                onPressed: () {
                  pro.ToggleFav(widget.product);
                },
                isSelected: pro.isFavExist(widget.product),
                icon: Icon(
                  IconlyBroken.heart,
                  color: Colors.black,
                ),
                selectedIcon: Icon(
                  IconlyBold.heart,
                  color: Colors.orange,
                ),
              );
            },
          )
        ],
      );
}
