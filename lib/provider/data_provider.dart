import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class DataProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  final List<String> couponCodes = ["ABC123", "XYZ123"];

  List<Product> get cart => _cart;

  List<Product> _favourties = [];
  List<Product> get favourites => _favourties;

  void addToCart(Product product) {
    if (_cart.contains(product)) {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        "Failed",
        "Already Added to Cart",
        backgroundColor: Colors.orange.withOpacity(0.3),
        animationDuration: Durations.medium1,
        // duration: Duration(seconds: 2),
      );
    } else {
      _cart.add(product);
      Get.closeCurrentSnackbar();
      Get.snackbar(
        "Success",
        "Product Added to Cart Successfully",
        backgroundColor: Colors.orange.withOpacity(0.3),
        animationDuration: Durations.medium1,
        // duration: Duration(seconds: 2),
      );
    }
    notifyListeners();
    print(_cart);
  }

  void plusOne(int index) {
    if (_cart[index].quantity < 10) {
      _cart[index].quantity++;
    } else {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        "Failed",
        "Maximum Quantity is 10",
        backgroundColor: Colors.orange.withOpacity(0.3),
        animationDuration: Durations.medium1,
        // duration: Duration(seconds: 2),
      );
    }
    notifyListeners();
  }

  void minusOne(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
    }
    notifyListeners();
  }

  removeFromCart(int index) {
    _cart.removeAt(index);
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Success",
      "Product Removed from Cart Successfully",
      backgroundColor: Colors.orange.withOpacity(0.3),
      animationDuration: Durations.medium1,
      // duration: Duration(seconds: 2),
    );
    notifyListeners();
  }

  double subtotalprice() {
    double totalPrice = _cart.fold(
      0.0,
      (previousValue, element) {
        return previousValue + (element.price * element.quantity);
      },
    );
    return totalPrice;
  }

  double totalprice() {
    double totalPrice = _cart.fold(
      0.0,
      (previousValue, element) {
        return previousValue + (element.price * element.quantity);
      },
    );
    totalPrice;

    return totalPrice;
  }

  void ToggleFav(Product product) {
    if (_favourties.contains(product)) {
      _favourties.remove(product);
      Get.closeCurrentSnackbar();
      Get.snackbar(
        "Removed From Favourites",
        "Product Removed from Favourites Successfully",
        backgroundColor: Colors.orange.withOpacity(0.3),
        animationDuration: Durations.medium1,
        // duration: Duration(seconds: 2),
      );
    } else {
      _favourties.add(product);
      Get.closeCurrentSnackbar();
      Get.snackbar(
        "Added To Favourites",
        "Product Added to Favourites Successfully",
        backgroundColor: Colors.orange.withOpacity(0.3),
        animationDuration: Durations.medium1,
        // duration: Duration(seconds: 2),
      );
    }
    notifyListeners();
    print(_favourties);
  }

  bool isFavExist(Product product) {
    return _favourties.contains(product);
  }

  removeFromFav(int index) {
    _favourties.removeAt(index);
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Success",
      "Product Removed from Favourites Successfully",
      backgroundColor: Colors.orange.withOpacity(0.3),
      animationDuration: Durations.medium1,
      // duration: Duration(seconds: 2),
    );
    notifyListeners();
  }
}
