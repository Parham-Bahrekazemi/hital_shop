import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/extentions/string_extention.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/product/controller/product_details_controller.dart';
import 'package:hital_shop/modules/product/pages/commets_page.dart';
import 'package:hital_shop/modules/product/widgets/product_slider_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(productId),
      builder: (ProductDetailsController controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                AppbarWidget(
                  widget: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        controller.bookmark();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: controller.productModel?.bookmark == true
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                color: Color(0xffED723F),
                              )
                            : const Icon(
                                CupertinoIcons.heart,
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 9.43),
                Expanded(
                  child: controller.productModel == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ProductSliderWidget(
                                iamges: controller.productModel!.gallery!,
                              ),
                              const SizedBox(height: 9),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'دسته بندی: ${controller.productModel?.category}',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    Visibility(
                                      visible: controller.productModel!
                                                  .discountPercent ==
                                              0
                                          ? false
                                          : true,
                                      child: Row(
                                        children: [
                                          Text(
                                            controller
                                                    .productModel?.realPrice ??
                                                ''.toString().farsiConvert,
                                            style: const TextStyle(
                                              color: Color(0xff8C8C8C),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFF3D3D),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${controller.productModel?.discountPercent.toString().farsiConvert}%',
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 260,
                                      child: Text(
                                        controller.productModel?.title ?? '',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.productModel?.price
                                              ?.farsiConvert ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    SizedBox(
                                      width: 22,
                                      height: 33,
                                      child: SvgPicture.asset(
                                          'assets/images/toman.svg'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 19.78),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),
                                child: Text(
                                  controller.productModel?.description ?? '',
                                  style: const TextStyle(
                                    color: Color(0xff8C8C8C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 46),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 55,
                                  elevation: 0,
                                  onPressed: () {
                                    Get.to(
                                      CommnetPage(
                                        productId: productId,
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(Iconsax.message_text_1,
                                          size: 22),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'نظرات',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${controller.productModel!.reviewsCount} نظر'
                                            .farsiConvert,
                                        style: const TextStyle(
                                          color: Color(0xff8C8C8C),
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(width: 13.5),
                                      const Icon(
                                        CupertinoIcons.chevron_left,
                                        color: Color(0xff8C8C8C),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                ),
                if (controller.productModel != null)
                  Container(
                    width: double.infinity,
                    height: 87,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 26),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -3),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.09),
                        ),
                      ],
                    ),
                    child: controller.productModel?.cartCount != 0
                        ? Container(
                            width: double.infinity,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => controller.addTocart(true),
                                    child: const Icon(
                                      Iconsax.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (controller.cartLoading == false)
                                    Text(
                                      controller.productModel?.cartCount
                                              .toString() ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  if (controller.cartLoading != false)
                                    const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  const Spacer(),
                                  controller.productModel?.cartCount == 1
                                      ? GestureDetector(
                                          onTap: () =>
                                              controller.addTocart(false),
                                          child: const Icon(
                                            Iconsax.trash,
                                            color: Colors.white,
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () =>
                                              controller.addTocart(false),
                                          child: const Icon(
                                            Iconsax.minus,
                                            color: Colors.white,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          )
                        : ButtonWidget(
                            title: 'افزودن به سبد خرید',
                            onPressed: () {
                              controller.addTocart(true);
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
