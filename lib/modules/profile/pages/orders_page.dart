import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/extentions/string_extention.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/modules/profile/controller/orders_controller.dart';

class Orderspage extends StatelessWidget {
  const Orderspage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderStatus orderStatus(String status) {
      if (status == 'پرداخت شده' || status == 'تحویل داده شده') {
        return OrderStatus(
          bgColor: const Color(0xff2AC066),
          txtColor: Colors.white,
        );
      }

      if (status == 'در حال پرداخت' || status == 'در حال آماده سازی') {
        return OrderStatus(
          bgColor: const Color(0xffFEEBEB),
          txtColor: const Color(0xffF31A1A),
        );
      }
      if (status == 'لغو شده') {
        return OrderStatus(
          bgColor: const Color(0xffF31A1A),
          txtColor: Colors.white,
        );
      }

      return OrderStatus(bgColor: Colors.black, txtColor: Colors.white);
    }

    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (OrdersController controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const AppbarWidget(title: 'سفارشات'),
                const SizedBox(height: 31),
                controller.response == null
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.response?.data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            var listOrders = controller.response!.data!;
                            OrderStatus status = orderStatus(
                                controller.response!.data![index].status!);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 23.5),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20.55),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff7B7B7B)
                                          .withOpacity(0.09),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 7),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: <Widget>[
                                          const Text(
                                            'ارسال سفارش به : ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8C8C8C),
                                            ),
                                          ),
                                          Text(
                                            listOrders[index].address ?? '',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Text(
                                            'شماره سفارش : ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            listOrders[index].trackingCode ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      child: SizedBox(
                                        height: 50,
                                        child: ListView.builder(
                                          itemCount: listOrders[index]
                                                  .products
                                                  ?.length ??
                                              0,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int indexListView) {
                                            return Stack(
                                              alignment: Alignment.topLeft,
                                              children: <Widget>[
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                        color:
                                                            Color(0xffD4D4D4),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Image.network(
                                                      listOrders[index]
                                                              .products?[
                                                                  indexListView]
                                                              .image ??
                                                          'https://dl.hitaldev.com/ecommerce/product_images/412286.jpg',
                                                      height: 38,
                                                      width: 50,
                                                    ),
                                                  ),
                                                ),
                                                if (listOrders[index]
                                                        .products?[
                                                            indexListView]
                                                        .count !=
                                                    1)
                                                  Positioned(
                                                    left: 6.5,
                                                    child: Container(
                                                      width: 12,
                                                      height: 12,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xffCBE0FF),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          listOrders[index]
                                                                  .products?[
                                                                      indexListView]
                                                                  .count
                                                                  .toString() ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 19),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            listOrders[index]
                                                    .products
                                                    ?.length
                                                    .toString()
                                                    .farsiConvert ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 11),
                                          const Text(
                                            'قلم کالا',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8C8C8C),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          const Text(
                                            'قیمت سفارش : ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8C8C8C),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            listOrders[index]
                                                    .totalPrice
                                                    ?.farsiConvert ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          SvgPicture.asset(
                                              'assets/images/toman.svg',
                                              width: 16,
                                              height: 24),
                                          const Spacer(),
                                          Container(
                                            width: 86,
                                            height: 21,
                                            decoration: BoxDecoration(
                                              color: status.bgColor,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                              child: Text(
                                                listOrders[index].status ?? '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: status.txtColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          },
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

class OrderStatus {
  Color bgColor;
  Color txtColor;

  OrderStatus({
    required this.bgColor,
    required this.txtColor,
  });
}
