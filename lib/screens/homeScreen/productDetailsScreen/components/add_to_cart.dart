import 'package:ecommerce_with_provider/models/product_model.dart';
import 'package:ecommerce_with_provider/provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatefulWidget {
  Product product;
  AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, Provider, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 35,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.product.quantity > 1) {
                            widget.product.quantity--;
                          }
                        });
                      },
                      style: IconButton.styleFrom(
                          highlightColor: Colors.orange,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      icon: Icon(
                        Icons.remove_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.product.quantity.toString(),
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.product.quantity < 10) {
                              widget.product.quantity++;
                            }
                          });
                        },
                        style: IconButton.styleFrom(
                          highlightColor: Colors.orange,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.addToCart(widget.product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
