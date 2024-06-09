import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_with_provider/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSlider extends StatefulWidget {
  Product product;
  ProductImageSlider({super.key, required this.product});

  @override
  State<ProductImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ProductImageSlider> {
  CarouselController carouselController = CarouselController();

  int imageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.product.image.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                // color: CupertinoColors.systemFill,
                color: Color(0xffF5F5F5),
              ),
              padding: EdgeInsets.all(30),
              child: Center(
                child: Hero(
                  tag: widget.product.image,
                  child: Image.asset(
                    widget.product.image[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          carouselController: carouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                imageindex = index;
              });
            },
            autoPlay: true,
            disableCenter: true,
            aspectRatio: 10 / 7,
            // height: 300,
            viewportFraction: 1,
            animateToClosest: true,
          ),
        ),
        Positioned.fill(
          bottom: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: imageindex,
              count: widget.product.image.length,
              effect: WormEffect(
                type: WormType.thin,
                dotHeight: 7,
                dotWidth: 10,
                dotColor: CupertinoColors.white,
                activeDotColor: CupertinoColors.black,
                strokeWidth: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
