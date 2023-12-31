import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/response/order_response.dart';

class OrdersController extends GetxController {
  ProductRepository repository = ProductRepository();

  OrderResponse? response;

  void getOrders() async {
    response = await repository.getOrders();

    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
