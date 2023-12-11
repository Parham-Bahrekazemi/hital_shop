import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/product_model.dart';
import 'package:hital_shop/modules/product/controller/product_list_controller.dart';
import 'package:hital_shop/modules/product/pages/product_detail_page.dart';
import 'package:hital_shop/modules/product/pages/product_list_page.dart';
import 'package:iconsax/iconsax.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.title,
    required this.productModel,
    this.sortProduct,
  });

  final String title;

  final List<ProductModel> productModel;

  final SortProduct? sortProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.to(
                  ProductListPage(
                    sort: sortProduct,
                  ),
                ),
                child: Text(
                  'نمایش همه',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                Iconsax.arrow_left,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: productModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => Get.to(
                      ProductDetailPage(productId: productModel[index].id!),
                    ),
                    child: Column(
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
                                    color: Theme.of(context).dividerColor),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                    color: const Color(0xff14489E)
                                        .withOpacity(0.15),
                                  ),
                                ],
                              ),
                              child: Image.network(productModel[index].image ??
                                  'https://dl.hitaldev.com/ecommerce/category_images/400967.png'),
                            ),
                            if (productModel[index].discountPercent != 0)
                              Positioned(
                                left: 6,
                                top: 6,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFF3D3D),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${productModel[index].discountPercent}%',
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
                                productModel[index].price ?? '',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/toman.svg',
                                width: 14,
                                height: 23,
                              ),
                              const Spacer(),
                              Visibility(
                                visible:
                                    productModel[index].discountPercent != 0
                                        ? true
                                        : false,
                                child: Text(
                                  productModel[index].realPrice ?? '',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xff8C8C8C),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 117,
                          child: Text(
                            productModel[index].title ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
    );
  }
}
