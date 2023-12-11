import 'package:hital_shop/backend/models/categories_model.dart';
import 'package:hital_shop/backend/models/product_model.dart';

class DashboardResponse {
  List<String>? sliders;
  List<CategoriesModel>? categories;
  List<ProductModel>? discountedProducts;
  List<ProductModel>? latestProducts;

  DashboardResponse(
      {this.sliders,
      this.categories,
      this.discountedProducts,
      this.latestProducts});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    sliders = json['sliders'].cast<String>();
    if (json['categories'] != null) {
      categories = <CategoriesModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoriesModel.fromJson(v));
      });
    }
    if (json['discounted_products'] != null) {
      discountedProducts = <ProductModel>[];
      json['discounted_products'].forEach((v) {
        discountedProducts!.add(ProductModel.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <ProductModel>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sliders'] = sliders;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (discountedProducts != null) {
      data['discounted_products'] =
          discountedProducts!.map((v) => v.toJson()).toList();
    }
    if (latestProducts != null) {
      data['latest_products'] = latestProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
