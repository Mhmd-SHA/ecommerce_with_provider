import 'package:ecommerce_with_provider/provider/data_provider.dart';
import 'package:ecommerce_with_provider/screens/cartScreen/components/cart_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              "My Cart",
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
                  itemCount: Provider.cart.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CartTile(
                        product: Provider.cart[index], index: index);
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    CupertinoSearchTextField(
                      prefixIcon: SizedBox(),
                      prefixInsets: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.all(10),
                      placeholder: "Enter Discount Code",
                      borderRadius: BorderRadius.circular(25),
                      suffixIcon: Icon(
                        IconlyBold.discount,
                        color: Colors.orange,
                      ),
                      suffixInsets: EdgeInsets.only(right: 15),
                      suffixMode: OverlayVisibilityMode.always,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SubTotal",
                          style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "\$ ${Provider.subtotalprice().toStringAsFixed(2)}",
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: CupertinoColors.systemGrey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$ ${Provider.totalprice().toStringAsFixed(2)}",
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ))
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
