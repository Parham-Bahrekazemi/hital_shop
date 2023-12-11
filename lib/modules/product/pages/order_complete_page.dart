import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/product/pages/order_page.dart';
import 'package:hital_shop/modules/profile/pages/orders_page.dart';
import 'package:iconsax/iconsax.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({super.key, required this.type, required this.id});

  final String type;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 542,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 93),
                  Icon(
                    Iconsax.tick_square,
                    size: 60,
                    color: type == 'success'
                        ? const Color(0xff1CAE00)
                        : const Color(0xffFF3D51),
                  ),
                  const SizedBox(height: 37),
                  Text(
                    type == 'success'
                        ? 'پرداخت با موفقیت انجام شد'
                        : 'پرداخت موفق نبود',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: type == 'success'
                          ? const Color(0xff1CAE00)
                          : const Color(0xffFF3D51),
                    ),
                  ),
                  const SizedBox(height: 70),
                  const Text(
                    'کد رهگیری',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff9A9A9A),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '۱۲۳۴۵۶۷۸۹',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 85),
                  ButtonWidget(
                    title: 'رفتن به سفارشات',
                    onPressed: () {
                      Get.off(const Orderspage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
