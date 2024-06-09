import 'package:ecommerce_with_provider/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  ProductCategory({
    super.key,
    required this.selectedIndex,
    required this.ontap,
  });
  int selectedIndex;
  Function ontap;

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.ontap(index);
                    print(index);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.selectedIndex == index
                        ? CupertinoColors.systemFill
                        : null,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage(categoriesList[index].image),
                      ),
                      Text(categoriesList[index].title),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 15,
              );
            },
            itemCount: categoriesList.length),
      ),
    );
  }
}
