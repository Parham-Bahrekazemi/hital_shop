import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/home/controllers/categories_controller.dart';
import 'package:hital_shop/modules/product/pages/product_list_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      init: CategoriesController(),
      builder: (CategoriesController controller) {
        return controller.categoriesResponse?.data == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('دسته بندی ها'),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount:
                            controller.categoriesResponse?.data?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 110,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Get.to(
                              ProductListPage(
                                categoryId: controller
                                    .categoriesResponse!.data![index].id,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: 81,
                                  height: 81,
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
                                  child: Image.network(controller
                                          .categoriesResponse!
                                          .data![index]
                                          .image ??
                                      'https://dl.hitaldev.com/ecommerce/category_images/400967.png'),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  controller
                                      .categoriesResponse!.data![index].title
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
