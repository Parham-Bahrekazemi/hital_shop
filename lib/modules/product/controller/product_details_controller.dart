import 'package:get/get.dart';
import 'package:hital_shop/backend/models/product_model.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/repository/profile_repository.dart';
import 'package:hital_shop/modules/product/controller/cart_controller.dart';
import 'package:hital_shop/modules/profile/controller/bookmarks_controller.dart';

class ProductDetailsController extends GetxController {
  ProductRepository repository = ProductRepository();

  ProductModel? productModel;

  ProfileRespository profileRespository = ProfileRespository();

  final int id;

  ProductDetailsController(this.id);

  void getProductDetail() async {
    productModel = await repository.getProductDetail(id);
    update();
  }

  void bookmark() async {
    var response = await profileRespository.bookmark(id);

    if (response) {
      productModel!.bookmark = !productModel!.bookmark!;
      if (Get.isRegistered<BookmarksController>()) {
        Get.find<BookmarksController>().getBookmarks();
      }
      update();
    }
  }

  bool cartLoading = false;

  void addTocart(bool increment) async {
    cartLoading = true;
    update();
    var response =
        await repository.addToCart(productId: id, increment: increment);

    productModel!.cartCount = response;
    Get.find<CartController>().getCart();
    cartLoading = false;

    update();
  }

  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }
}
