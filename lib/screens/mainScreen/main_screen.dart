import 'package:ecommerce_with_provider/screens/cartScreen/cart_screen.dart';
import 'package:ecommerce_with_provider/screens/categoryScreen/category_screen.dart';
import 'package:ecommerce_with_provider/screens/favouriteScreen/favourite_screen.dart';
import 'package:ecommerce_with_provider/screens/homeScreen/home_screen.dart';
import 'package:ecommerce_with_provider/screens/mainScreen/components/bottom_navbar.dart';
import 'package:ecommerce_with_provider/screens/profileScreen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List screens = [
    HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        ontap: changeIndex,
      ),
    );
  }
}
