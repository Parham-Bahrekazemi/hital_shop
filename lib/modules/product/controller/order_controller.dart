import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/address_model.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/repository/profile_repository.dart';
import 'package:hital_shop/backend/response/address_response.dart';
import 'package:hital_shop/modules/product/controller/cart_controller.dart';
import 'package:hital_shop/modules/product/pages/payment_page.dart';
import 'package:hital_shop/modules/product/widgets/radio_widget.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OrderController extends GetxController {
  ProfileRespository respository = ProfileRespository();

  ProductRepository productRepository = ProductRepository();

  AddressResponse? addressResponse;

  AddressModel? selectedAddress;

  ShippingMethod? selectedMethod;

  void getAddress() async {
    addressResponse = await respository.getAddress();
    update();
  }

  void deleteAddress(int id) async {
    var response = await respository.deleteAddress(id);
    if (response) {
      addressResponse!.data!.removeWhere((element) => element.id == id);
      update();
    }
  }

  void selectAddress(AddressModel address) {
    selectedAddress = address;
    update();
  }

  void selectMethod(ShippingMethod shippingMethod) {
    selectedMethod = shippingMethod;

    update();
  }

  String getTotalPrice() {
    var totalPrice = Get.find<CartController>().cartResponse!.totalPrice;
    var total = int.parse(totalPrice!.replaceAll(',', ''));
    var shippingPrice = 0;
    if (selectedMethod != null) {
      shippingPrice = int.parse(selectedMethod!.price.replaceAll(',', ''));
    }

    return (total + shippingPrice).separateFarsiPrice;
  }

  bool paymnetLoding = false;

  void order() async {
    paymnetLoding = true;
    update();
    String link = await productRepository.order(
      addressId: selectedAddress!.id!,
      shippingMethod: selectedMethod!.value,
    );
    paymnetLoding = false;
    update();

    if (kIsWeb) {
      await launchUrlString(link, webOnlyWindowName: '_self');
    } else {
      Get.to(PaymentPage(
        link: link,
      ));
    }
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}

extension FarsiseparatePrice on int? {
  String get separateFarsiPrice => NumberFormat("#,###", 'fa_IR').format(this);
}
