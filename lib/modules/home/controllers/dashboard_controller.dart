import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/response/dashboard_response.dart';

class DashboardController extends GetxController {
  ProductRepository homeRepository = ProductRepository();

  DashboardResponse? dashboardResponse;

  Future<void> getDashboard() async {
    dashboardResponse = await homeRepository.getDashboard();
    update();
  }

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }
}
