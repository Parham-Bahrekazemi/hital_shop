import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/extentions/string_extention.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/modules/product/controller/product_list_controller.dart';
import 'package:hital_shop/modules/product/pages/product_detail_page.dart';
import 'package:iconsax/iconsax.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key, this.categoryId, this.sort});

  final int? categoryId;
  final SortProduct? sort;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      init: ProductListController(categoryId, sort),
      builder: (ProductListController controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: controller.categoriesModel == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : Column(
                    children: <Widget>[
                      const AppbarWidget(
                        title: 'محصولات',
                      ),
                      const SizedBox(height: 16.31),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 43.25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 4,
                                      color: const Color(0xffEA5E24)
                                          .withOpacity(0.15),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: controller.textSearch,
                                  onChanged: (String value) {
                                    controller.search(value);
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'نام محصول مورد نظر را بنویسید',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15.51, vertical: 3),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: Icon(
                                      Iconsax.search_normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6.13),
                            PopupMenuButton<SortProduct>(
                              onSelected: (SortProduct value) =>
                                  controller.sortProduct(value),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(
                                    value: SortProduct(
                                        orderC: 'id', orderT: 'DESC'),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xffDEDEDE),
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: const Center(
                                        child: Text(
                                          'جدیدترین',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: SortProduct(
                                        orderC: 'discount', orderT: 'DESC'),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xffDEDEDE),
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: const Center(
                                        child: Text(
                                          'بیشترین تخفیف',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: SortProduct(
                                        orderC: 'price', orderT: 'ASC'),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xffDEDEDE),
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: const Center(
                                        child: Text(
                                          'ارزانترین',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: SortProduct(
                                        orderC: 'price', orderT: 'DESC'),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: const Center(
                                        child: Text(
                                          'گرانترین',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ];
                              },
                              child: Container(
                                width: 43.25,
                                height: 43.25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 4,
                                      color: const Color(0xffEA5E24)
                                          .withOpacity(0.15),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Iconsax.sort,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 19.33),
                      SizedBox(
                        height: 29,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20.5),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categoriesModel?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => controller.selectedCategory(
                                  controller.categoriesModel![index].id!),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(left: 9.5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 3),
                                decoration: BoxDecoration(
                                  color: controller.selectedCategoryId ==
                                          controller.categoriesModel![index].id!
                                      ? Theme.of(context).primaryColor
                                      : null,
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  controller.categoriesModel?[index].title ??
                                      '',
                                  style: TextStyle(
                                    color: controller.selectedCategoryId ==
                                            controller
                                                .categoriesModel![index].id!
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (controller.productModel != null &&
                          controller.productModel!.isNotEmpty)
                        Expanded(
                          child: GridView.builder(
                            itemCount: controller.productModel?.length,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.5,
                              vertical: 20.5,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisExtent: 200,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => Get.to(
                                  ProductDetailPage(
                                    productId:
                                        controller.productModel![index].id!,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(20),
                                          width: 117,
                                          height: 129,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .dividerColor),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                offset: const Offset(0, 1),
                                                color: const Color(0xff14489E)
                                                    .withOpacity(0.15),
                                              ),
                                            ],
                                          ),
                                          child: Image.network(controller
                                                  .productModel?[index].image ??
                                              'https://dl.hitaldev.com/ecommerce/category_images/400967.png'),
                                        ),
                                        if (controller.productModel?[index]
                                                .discountPercent !=
                                            0)
                                          Positioned(
                                            left: 6,
                                            top: 6,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 3,
                                                vertical: 1,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFF3D3D),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${controller.productModel?[index].discountPercent}%'
                                                      .farsiConvert,
                                                  style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 6.5),
                                    SizedBox(
                                      width: 117,
                                      child: Row(
                                        children: [
                                          Text(
                                            controller.productModel?[index]
                                                    .price?.farsiConvert ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 2),
                                          SvgPicture.asset(
                                            'assets/images/toman.svg',
                                            width: 14,
                                            height: 23,
                                          ),
                                          const Spacer(),
                                          Visibility(
                                            visible: controller
                                                        .productModel?[index]
                                                        .discountPercent !=
                                                    0
                                                ? true
                                                : false,
                                            child: Text(
                                              controller
                                                      .productModel?[index]
                                                      .realPrice
                                                      ?.farsiConvert ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff8C8C8C),
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 117,
                                      child: Center(
                                        child: Text(
                                          controller
                                                  .productModel?[index].title ??
                                              '',
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      if (controller.productModel == null ||
                          controller.productModel!.isEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: const Center(
                            child: Text(
                              'محصولی وجود ندارد',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
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
