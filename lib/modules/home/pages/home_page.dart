import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/home/controllers/home_controller.dart';
import 'package:hital_shop/modules/home/pages/categories_page.dart';
import 'package:hital_shop/modules/home/pages/dashboard_page.dart';
import 'package:hital_shop/modules/product/controller/cart_controller.dart';
import 'package:hital_shop/modules/product/pages/cart_page.dart';
import 'package:hital_shop/modules/product/pages/product_list_page.dart';
import 'package:hital_shop/modules/profile/pages/bookmarks_page.dart';
import 'package:hital_shop/modules/profile/pages/profile_page.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.5,
                    vertical: 17.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topRight,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => controller.changePage(2),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xffEEEEEE),
                                ),
                              ),
                              child: const Icon(
                                Iconsax.bag_2,
                                size: 28,
                              ),
                            ),
                          ),
                          GetBuilder<CartController>(
                              init: CartController(),
                              builder: (CartController controller) {
                                return controller.cartResponse == null
                                    ? Container()
                                    : controller.cartResponse!.totalItems == 0
                                        ? Container()
                                        : Container(
                                            width: 16,
                                            height: 16,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffFF6060),
                                            ),
                                            child: Center(
                                              child: Text(
                                                controller.cartResponse
                                                        ?.totalItems
                                                        .toString() ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                              }),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/logo_horizontal.png',
                        height: 40,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.to(
                          const ProductListPage(),
                        ),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                            ),
                          ),
                          child: const Icon(
                            Iconsax.search_normal,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    children: const <Widget>[
                      DashboardPage(),
                      CategoriesPage(),
                      CartPage(),
                      BookMarkPage(),
                      ProfilePage(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 110,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.09),
                              blurRadius: 6,
                              offset: const Offset(0, -3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              controller.items.length,
                              (index) => Padding(
                                padding: index == 1
                                    ? const EdgeInsets.only(
                                        left: 50,
                                      )
                                    : const EdgeInsets.all(0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changePage(index + 1);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        controller.items[index].icon,
                                      ),
                                      const SizedBox(height: 6),
                                      if (controller.currentindex == index + 1)
                                        Container(
                                          width: 20,
                                          height: 2,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: GestureDetector(
                          onTap: () => controller.changePage(0),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff3B7BE3),
                                  Color(0xff29388B),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Iconsax.home_2,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
