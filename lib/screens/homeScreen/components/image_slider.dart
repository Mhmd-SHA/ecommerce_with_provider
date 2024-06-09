import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_with_provider/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();

  int imageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: sliderImages.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  sliderImages[index],
                  fit: BoxFit.cover,
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
            aspectRatio: 10 / 5,
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
              count: sliderImages.length,
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
