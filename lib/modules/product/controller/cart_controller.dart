import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/response/cart_response.dart';

class CartController extends GetxController {
  ProductRepository repository = ProductRepository();

  CartResponse? cartResponse;

  void getCart() async {
    cartResponse = await repository.getCart();
    update();
  }

  bool cartLoading = false;

  void addTocart(bool increment, int id, [bool? delete = false]) async {
    cartLoading = true;
    update();
    var response = await repository.addToCart(
        productId: id, increment: increment, delete: delete!);

    getCart();
    cartLoading = false;

    update();
  }

  @override
  void onInit() {
    getCart();
    super.onInit();
  }
}
