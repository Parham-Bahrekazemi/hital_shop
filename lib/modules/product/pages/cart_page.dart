import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/extentions/string_extention.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/product/controller/cart_controller.dart';
import 'package:hital_shop/modules/product/pages/order_page.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<CartController>(
      builder: (CartController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'سبد خرید',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              controller.cartResponse == null
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor),
                      ),
                    )
                  : controller.cartResponse == null ||
                          controller.cartResponse!.totalItems == 0
                      ? const Expanded(
                          child: Center(
                            child: Text(
                              'سبد خرید خالی است',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount:
                                controller.cartResponse?.items?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  const SizedBox(height: 28.5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 83,
                                          width: 83,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .dividerColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xff14489E)
                                                    .withOpacity(0.15),
                                                offset: const Offset(0, 1),
                                                blurRadius: 3,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Image.network(
                                              controller
                                                      .cartResponse
                                                      ?.items?[index]
                                                      .product
                                                      ?.image ??
                                                  'https://dl.hitaldev.com/ecommerce/product_images/433217.jpg',
                                              width: 60,
                                              height: 60,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: SizedBox(
                                          height: 104,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                controller
                                                        .cartResponse
                                                        ?.items?[index]
                                                        .product
                                                        ?.title ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const Spacer(),
                                              Text(
                                                controller
                                                        .cartResponse
                                                        ?.items?[index]
                                                        .product
                                                        ?.realPrice
                                                        .toString() ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff8C8C8C),
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  height: 0.5,
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    controller
                                                            .cartResponse
                                                            ?.items?[index]
                                                            .product
                                                            ?.price
                                                            .toString() ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  SvgPicture.asset(
                                                    'assets/images/toman.svg',
                                                    width: 22,
                                                    height: 33,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.addTocart(
                                                  false,
                                                  controller
                                                      .cartResponse!
                                                      .items![index]
                                                      .product!
                                                      .id!,
                                                  true,
                                                );
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .dividerColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(
                                                              0xffEA5E24)
                                                          .withOpacity(0.18),
                                                      offset:
                                                          const Offset(0, 1),
                                                      blurRadius: 4,
                                                    ),
                                                  ],
                                                ),
                                                child: Icon(
                                                  Iconsax.trash,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 32,
                                              width: 103,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xffEA5E24)
                                                            .withOpacity(0.18),
                                                    offset: const Offset(0, 1),
                                                    blurRadius: 4,
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 13,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () =>
                                                          controller.addTocart(
                                                        false,
                                                        controller
                                                            .cartResponse!
                                                            .items![index]
                                                            .product!
                                                            .id!,
                                                      ),
                                                      child: Icon(
                                                        Iconsax.minus,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    if (controller
                                                            .cartLoading ==
                                                        false)
                                                      Text(
                                                        controller
                                                                .cartResponse
                                                                ?.items?[index]
                                                                .count
                                                                .toString()
                                                                .farsiConvert ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    if (controller
                                                            .cartLoading ==
                                                        true)
                                                      SizedBox(
                                                        height: 16,
                                                        width: 16,
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    GestureDetector(
                                                      onTap: () =>
                                                          controller.addTocart(
                                                        true,
                                                        controller
                                                            .cartResponse!
                                                            .items![index]
                                                            .product!
                                                            .id!,
                                                      ),
                                                      child: Icon(
                                                        Iconsax.add,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 26),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: const Color(0xffE1E1E1),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
              const SizedBox(height: 20),
              if (controller.cartResponse != null &&
                  controller.cartResponse!.totalItems != 0)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff14489E).withOpacity(0.15),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.63),
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  controller.cartResponse?.price
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
                        padding: const EdgeInsets.symmetric(horizontal: 17.63),
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  controller.cartResponse?.discountPrice
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
                      const SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                          color: Theme.of(context).primaryColor,
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
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    controller.cartResponse?.totalPrice
                                            .toString()
                                            .farsiConvert ??
                                        '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  SvgPicture.asset(
                                    'assets/images/toman.svg',
                                    width: 16,
                                    height: 24,
                                    color: Colors.white,
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
              const SizedBox(height: 10),
              if (controller.cartResponse != null &&
                  controller.cartResponse!.totalItems != 0)
                ButtonWidget(
                  title: 'ثبت سفارش',
                  onPressed: () {
                    Get.to(
                      const OrderPage(),
                    );
                  },
                ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
