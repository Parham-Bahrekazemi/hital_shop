import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/home/controllers/dashboard_controller.dart';
import 'package:hital_shop/modules/home/widgets/category_list_widgets.dart';
import 'package:hital_shop/modules/home/widgets/product_list_widgets.dart';
import 'package:hital_shop/modules/home/widgets/slider_widget.dart';
import 'package:hital_shop/modules/product/controller/product_list_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return controller.dashboardResponse == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SliderWidget(
                        iamges: controller.dashboardResponse!.sliders!),
                    const SizedBox(height: 28),
                    CategoryListWidget(
                      categoryModel: controller.dashboardResponse!.categories!,
                    ),
                    const SizedBox(height: 15),
                    ProductListWidget(
                      title: 'تخفیف های شگفت انگیز',
                      productModel:
                          controller.dashboardResponse!.discountedProducts!,
                      sortProduct:
                          SortProduct(orderC: 'discount', orderT: 'DESC'),
                    ),
                    const SizedBox(height: 32),
                    ProductListWidget(
                      title: 'جدیدترین محصولات',
                      productModel:
                          controller.dashboardResponse!.latestProducts!,
                      sortProduct: SortProduct(orderC: 'id', orderT: 'DESC'),
                    )
                  ],
                ),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
