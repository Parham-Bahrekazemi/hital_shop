import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/response/categories_response.dart';

class CategoriesController extends GetxController {
  ProductRepository homeRepository = ProductRepository();

  CategoriesResponse? categoriesResponse;

  Future<void> getCategories() async {
    categoriesResponse = await homeRepository.getCategories();
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
