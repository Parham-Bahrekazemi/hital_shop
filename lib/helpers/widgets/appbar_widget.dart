import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    this.title,
    this.widget,
  });

  final Widget? widget;

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.57,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: const Offset(0, 1),
            color: const Color(0xff6A6A6A).withOpacity(0.15),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          if (title != null)
            Center(
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: const EdgeInsets.only(left: 21.5),
                padding: const EdgeInsets.all(7),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Iconsax.arrow_left),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 21.5),
              child: widget,
            ),
          ),
        ],
      ),
    );
  }
}
