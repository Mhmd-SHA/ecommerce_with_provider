import 'package:ecommerce_with_provider/models/product_model.dart';
import 'package:ecommerce_with_provider/provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  Product product;
  int index;
  CartTile({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, Provider, child) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemFill,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    product.image.first,
                    height: 75,
                    width: 70,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Provider.removeFromCart(index);
                          },
                          style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          icon: Icon(
                            IconlyBroken.delete,
                            size: 20,
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          product.category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CupertinoColors.systemFill,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  Provider.minusOne(index);
                                },
                                style: IconButton.styleFrom(
                                    highlightColor: Colors.orange.shade100,
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                icon: Icon(
                                  Icons.remove_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                Provider.cart[index].quantity.toString(),
                                style: TextStyle(
                                  color: CupertinoColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  Provider.plusOne(index);
                                },
                                style: IconButton.styleFrom(
                                  highlightColor: Colors.orange.shade100,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                icon: Icon(
                                  Icons.add_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
