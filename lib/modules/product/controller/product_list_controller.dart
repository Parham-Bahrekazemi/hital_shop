import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/categories_model.dart';
import 'package:hital_shop/backend/models/product_model.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/response/categories_response.dart';
import 'package:hital_shop/backend/response/product_response.dart';

class ProductListController extends GetxController {
  final int? categoryId;
  final SortProduct? defaultSort;
  SortProduct? selectedSort;

  ProductListController(this.categoryId, this.defaultSort);

  List<CategoriesModel>? categoriesModel;
  List<ProductModel>? productModel;
  ProductRepository homeRepository = ProductRepository();

  TextEditingController textSearch = TextEditingController();

  int? selectedCategoryId;

  Future<void> getCategories() async {
    CategoriesResponse? response = await homeRepository.getCategories();
    categoriesModel = response?.data;
    update();
  }

  Future<void> getFilterCategories({String? keyword}) async {
    ProductResponse? response = await homeRepository.getFilterProducts(
      categoryId: selectedCategoryId,
      // != null ? selectedCategoryId! + 1 : null
      keyword: keyword,
      orderColumn: selectedSort?.orderC,
      orderType: selectedSort?.orderT,
    );
    productModel = response?.data;
    update();
  }

  void search(String keyword) {
    getFilterCategories(keyword: keyword);
  }

  void selectedCategory(int id) async {
    selectedCategoryId = id;
    getFilterCategories();
    update();
  }

  void sortProduct(SortProduct sortProduct) async {
    selectedSort = sortProduct;
    update();
    getFilterCategories();
  }

  @override
  void onInit() {
    selectedCategoryId = categoryId;
    selectedSort = defaultSort;
    getCategories();
    getFilterCategories();
    super.onInit();
  }
}

class SortProduct {
  String? orderC;
  String? orderT;

  SortProduct({required this.orderC, required this.orderT});
}
