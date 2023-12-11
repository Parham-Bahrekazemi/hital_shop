import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/extentions/string_extention.dart';
import 'package:hital_shop/modules/product/controller/order_controller.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({
    super.key,
  });

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  List<ShippingMethod> method = [
    ShippingMethod(
      title: 'پست پیشتاز (ارسال سریع)',
      price: '20,000',
      value: 1,
    ),
    ShippingMethod(
      title: 'تیپاکس',
      price: '10,000',
      value: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        method.length,
        (index) => GestureDetector(
          onTap: () {
            method.forEach((element) {
              element.isSelected = false;
            });
            method[index].isSelected = true;

            Get.find<OrderController>().selectMethod(method[index]);
            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 9),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  method[index].title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8C8C8C),
                  ),
                ),
                const Spacer(),
                Text(method[index].price.farsiConvert),
                const SizedBox(width: 4),
                SvgPicture.asset(
                  'assets/images/toman.svg',
                  width: 16,
                  height: 24,
                ),
                const SizedBox(width: 9.5),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff707070),
                    ),
                  ),
                  child: method[index].isSelected == true
                      ? Center(
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShippingMethod {
  String title;

  String price;

  bool isSelected;

  int value;

  ShippingMethod({
    required this.title,
    required this.price,
    this.isSelected = false,
    required this.value,
  });
}
