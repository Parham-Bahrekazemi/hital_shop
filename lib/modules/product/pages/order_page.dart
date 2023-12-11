import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/extentions/string_extention.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/product/controller/cart_controller.dart';
import 'package:hital_shop/modules/product/controller/order_controller.dart';
import 'package:hital_shop/modules/product/widgets/radio_widget.dart';
import 'package:hital_shop/modules/profile/pages/add_address_page.dart';
import 'package:iconsax/iconsax.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (OrderController controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const AppbarWidget(title: 'تکمیل سفارش'),
                controller.addressResponse == null
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'آدرس خود را انتخاب کنید',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: List.generate(
                                      controller
                                              .addressResponse?.data?.length ??
                                          0, (index) {
                                    var address = controller
                                        .addressResponse!.data![index];
                                    return GestureDetector(
                                      onTap: () {
                                        controller.selectAddress(
                                          address,
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 15.87,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: controller
                                                        .selectedAddress?.id ==
                                                    address.id
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .dividerColor,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10.45,
                                                left: 18.5,
                                                right: 18.5,
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    controller
                                                            .addressResponse
                                                            ?.data?[index]
                                                            .title ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                        AddAddressPage(
                                                          addressModel: controller
                                                              .addressResponse
                                                              ?.data![index],
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 26,
                                                      height: 26,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .dividerColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      child: Icon(
                                                        Iconsax.edit,
                                                        size: 17,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6.5),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller.deleteAddress(
                                                        controller
                                                            .addressResponse!
                                                            .data![index]
                                                            .id!,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 26,
                                                      height: 26,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .dividerColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      child: Icon(
                                                        Iconsax.trash,
                                                        size: 17,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 21.5,
                                                right: 21.5,
                                                top: 6,
                                              ),
                                              child: Text(
                                                controller
                                                        .addressResponse
                                                        ?.data?[index]
                                                        .address ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Color(0xff8C8C8C),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.5, bottom: 10),
                                              child: Visibility(
                                                visible: controller
                                                            .addressResponse
                                                            ?.data?[index]
                                                            .postalCode ==
                                                        null
                                                    ? false
                                                    : true,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    const Text(
                                                      'کد پستی :',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 2),
                                                    Text(
                                                      controller
                                                              .addressResponse
                                                              ?.data?[index]
                                                              .postalCode
                                                              .toString() ??
                                                          '',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff8C8C8C),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 30),
                                ButtonWidget(
                                  title: 'افزودن آدرس',
                                  onPressed: () {
                                    Get.to(const AddAddressPage());
                                  },
                                  hasBorder: true,
                                ),
                                const SizedBox(height: 19),
                                const Text(
                                  'شیوه ارسال را انتخاب کنید',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const RadioWidget(),
                                const SizedBox(height: 13),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff14489E)
                                            .withOpacity(0.15),
                                        blurRadius: 3,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      const SizedBox(height: 12),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17.63),
                                        child: Row(
                                          children: <Widget>[
                                            const Text(
                                              'هزینه ارسال :',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8C8C8C),
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  controller
                                                          .selectedMethod
                                                          ?.price
                                                          .farsiConvert ??
                                                      '۰',
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                SvgPicture.asset(
                                                  'assets/images/toman.svg',
                                                  width: 16,
                                                  height: 24,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17.63),
                                        child: Row(
                                          children: <Widget>[
                                            const Text(
                                              'مبلغ :',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8C8C8C),
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  Get.find<CartController>()
                                                          .cartResponse!
                                                          .price
                                                          .toString()
                                                          .farsiConvert ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                SvgPicture.asset(
                                                  'assets/images/toman.svg',
                                                  width: 16,
                                                  height: 24,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 11.5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17.63),
                                        child: Row(
                                          children: <Widget>[
                                            const Text(
                                              'مبلغ تخفیف :',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8C8C8C),
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  Get.find<CartController>()
                                                          .cartResponse!
                                                          .discountPrice
                                                          .toString()
                                                          .farsiConvert ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffFC7878),
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                SvgPicture.asset(
                                                  'assets/images/toman.svg',
                                                  width: 16,
                                                  height: 24,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 23),
                                      Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Color(0xffEFEFEF),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 17.63, vertical: 10),
                                          child: Row(
                                            children: <Widget>[
                                              const Text(
                                                'مبلغ کل :',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    controller
                                                        .getTotalPrice()
                                                        .farsiConvert,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  SvgPicture.asset(
                                                    'assets/images/toman.svg',
                                                    width: 16,
                                                    height: 24,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 32),
                                ButtonWidget(
                                  title: 'پرداخت آنلاین',
                                  onPressed: () {
                                    if (controller.selectedAddress == null) {
                                      errorMessage('لطفا یک آدرس انتخاب کنید');
                                    } else if (controller.selectedMethod ==
                                            null &&
                                        controller.selectedAddress != null) {
                                      errorMessage(
                                          'لطفا یک شیوه ارسال را انتخاب کنید');
                                    } else {
                                      controller.order();
                                    }
                                  },
                                  loading: controller.paymnetLoding,
                                ),
                              ],
                            ),
                          ),
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
