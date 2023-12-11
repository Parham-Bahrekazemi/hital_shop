import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/modules/product/controller/comment_controller.dart';
import 'package:hital_shop/modules/product/widgets/comment_bottom_sheet.dart';
import 'package:iconsax/iconsax.dart';

class CommnetPage extends StatelessWidget {
  const CommnetPage({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
        init: CommentController(productId),
        builder: (CommentController controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  const AppbarWidget(
                    title: 'نظرات',
                  ),
                  controller.reviewResponse == null
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      : controller.reviewResponse!.data!.isEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: const Center(
                                child: Text(
                                  'نظری وجود ندارد',
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
                                    controller.reviewResponse!.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 17,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(height: 19),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  controller.reviewResponse
                                                          ?.data?[index].user ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Color(0xff8C8C8C),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: SizedBox(
                                                    child: RatingBarIndicator(
                                                      unratedColor: const Color(
                                                          0xffEDEDED),
                                                      rating: controller
                                                              .reviewResponse
                                                              ?.data?[index]
                                                              .rate ??
                                                          0,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              const Icon(
                                                        Iconsax.star1,
                                                        color:
                                                            Color(0xffF4D42D),
                                                      ),
                                                      itemCount: 5,
                                                      itemSize: 24.0,
                                                      direction:
                                                          Axis.horizontal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 18,
                                              bottom: 17,
                                            ),
                                            child: Text(
                                              controller.reviewResponse
                                                      ?.data?[index].date ??
                                                  '',
                                              style: const TextStyle(
                                                color: Color(0xff8C8C8C),
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 18,
                                            ),
                                            child: Text(
                                              controller.reviewResponse
                                                      ?.data?[index].comment ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          if (controller.reviewResponse
                                                  ?.data?[index].reply ==
                                              null)
                                            const SizedBox(height: 10),
                                          if (controller.reviewResponse
                                                  ?.data?[index].reply !=
                                              null)
                                            const SizedBox(height: 40),
                                          Visibility(
                                            visible: controller.reviewResponse
                                                        ?.data?[index].reply !=
                                                    null
                                                ? true
                                                : false,
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16),
                                                  child: Container(
                                                    height: 1,
                                                    width: double.infinity,
                                                    color: Theme.of(context)
                                                        .dividerColor,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 20,
                                                    right: 16,
                                                    bottom: 20,
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      const Text(
                                                        'پاسخ :',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff8C8C8C),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        controller
                                                                .reviewResponse
                                                                ?.data?[index]
                                                                .reply ??
                                                            '',
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
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
                              ),
                            ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                showModalBottomSheet(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) => ShowModalBottemSheet(
                    productid: productId,
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
          );
        });
  }
}
