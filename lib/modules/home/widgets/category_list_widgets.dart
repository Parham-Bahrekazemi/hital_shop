import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/categories_model.dart';
import 'package:hital_shop/modules/home/controllers/home_controller.dart';
import 'package:hital_shop/modules/product/pages/product_list_page.dart';
import 'package:iconsax/iconsax.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.categoryModel});

  final List<CategoriesModel> categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text(
                'دسته بندی ها ',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.find<HomeController>().changePage(1),
                child: Row(
                  children: [
                    Text(
                      'نمایش همه',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
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
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      ProductListPage(
                        categoryId: categoryModel[index].id!,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: 91,
                          height: 91,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Theme.of(context).dividerColor),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                                color:
                                    const Color(0xff14489E).withOpacity(0.15),
                              ),
                            ],
                          ),
                          child: Image.network(categoryModel[index].image ??
                              'https://dl.hitaldev.com/ecommerce/category_images/400967.png'),
                        ),
                        const SizedBox(height: 6.5),
                        SizedBox(
                          width: 92,
                          child: Center(
                            child: Text(
                              categoryModel[index].title ?? '',
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
