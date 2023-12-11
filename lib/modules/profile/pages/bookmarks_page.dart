import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/product/pages/product_detail_page.dart';
import 'package:hital_shop/modules/profile/controller/bookmarks_controller.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarksController>(
      init: BookmarksController(),
      builder: (BookmarksController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'علاقه مندی ها',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              controller.productResponse == null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : controller.productResponse?.data != null &&
                          controller.productResponse!.data!.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text(
                              'محصولی وجود ندارد',
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
                                controller.productResponse?.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  const SizedBox(height: 28.5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            ProductDetailPage(
                                              productId: controller
                                                  .productResponse!
                                                  .data![index]
                                                  .id!,
                                            ),
                                          );
                                        },
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
                                              controller.productResponse
                                                      ?.data?[index].image ??
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
                                                controller.productResponse
                                                        ?.data?[index].title ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                controller
                                                            .productResponse
                                                            ?.data?[index]
                                                            .discountPercent ==
                                                        0
                                                    ? ''
                                                    : controller
                                                            .productResponse
                                                            ?.data?[index]
                                                            .realPrice ??
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
                                                            .productResponse
                                                            ?.data?[index]
                                                            .price ??
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
                                      GestureDetector(
                                        onTap: () {
                                          controller.bookmarkDelete(controller
                                              .productResponse!
                                              .data![index]
                                              .id!);
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
                                                color: const Color(0xffEA5E24)
                                                    .withOpacity(0.18),
                                                offset: const Offset(0, 1),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.heart_fill,
                                            color: Color(
                                              0xffED723F,
                                            ),
                                          ),
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
                        )
            ],
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
