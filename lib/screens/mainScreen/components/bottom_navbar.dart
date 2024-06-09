import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BottomNavbar extends StatefulWidget {
  int currentIndex;
  Function ontap;
  BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.ontap,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      iconSize: 20,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.blueGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        widget.ontap(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(IconlyBold.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyBold.category),
          label: "category",
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyBold.heart),
          label: "heart",
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyBold.buy),
          label: "buy",
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyBold.profile),
          label: "profile",
        ),
      ],
    );
  }
}
