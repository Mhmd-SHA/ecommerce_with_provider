import 'package:ecommerce_with_provider/models/product_model.dart';
import 'package:ecommerce_with_provider/provider/data_provider.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/productDetailsScreen/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SpecialProducts extends StatelessWidget {
  SpecialProducts({super.key, required this.products});
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, Provider, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special For You",
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "see all",
                      style: TextStyle(
                        color: CupertinoColors.systemGrey,
                      ),
                    ))
              ],
            ),
            GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              // padding: EdgeInsets.only(bottom: 25),
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3 / 3.5),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ProductDetailsScreen(
                        product: products[index],
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      color: CupertinoColors.systemFill,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Hero(
                                  tag: products[index].image,
                                  child: Image.asset(
                                    products[index].image.first,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    products[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: CupertinoColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "\$${products[index].price.toStringAsFixed(2)}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: CupertinoColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ...List.generate(
                                        products[index].colors.length,
                                        (indexx) {
                                          return Container(
                                            margin: EdgeInsets.all(2),
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: allProducts[index]
                                                  .colors[indexx],
                                              shape: BoxShape.circle,
                                            ),
                                          );
                                        },
                                      ).getRange(0, 3)
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    15,
                                  ),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  IconlyLight.heart,
                                  color: Colors.white,
                                ),
                                selectedIcon: Icon(
                                  IconlyBold.heart,
                                ),
                                isSelected:
                                    Provider.isFavExist(products[index]),
                                iconSize: 20,
                                padding: EdgeInsets.zero,
                                style: IconButton.styleFrom(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                onPressed: () {
                                  Provider.ToggleFav(products[index]);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
