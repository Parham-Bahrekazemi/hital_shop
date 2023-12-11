import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeController extends GetxController {
  List<MenuItem> items = [
    MenuItem(icon: Iconsax.element_3),
    MenuItem(icon: Iconsax.shopping_cart),
    MenuItem(icon: Iconsax.heart),
    MenuItem(icon: Iconsax.user),
  ];

  PageController pageController = PageController();

  void changePage(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    currentindex = page;
    update();
  }

  int currentindex = 0;
}

class MenuItem {
  IconData icon;

  bool selected;

  MenuItem({required this.icon, this.selected = false});
}
