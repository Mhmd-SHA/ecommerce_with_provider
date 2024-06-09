import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../models/product_model.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height - 250,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.title.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: CupertinoColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "\$${widget.product.price.toStringAsFixed(2)}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: CupertinoColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      IconlyBold.star,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.product.rate.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${widget.product.review.toString()}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Text(
                "Seller : ${widget.product.seller.toString()}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Colors",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: CupertinoColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              ...List.generate(
                widget.product.colors.length,
                (indexx) {
                  return AnimatedContainer(
                    duration: Durations.long1,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: 25,
                    height: 25,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: selectedColorIndex == indexx
                          ? Border.all(
                              color: widget.product.colors[indexx],
                              width: 2,
                            )
                          : null,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColorIndex = indexx;
                          // print(selectedColorIndex);
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: widget.product.colors[indexx],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Description",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "Specification  ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 15,
                ),
              ),
              Text(
                "Review  ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 15,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.product.description.toString(),
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              // fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
