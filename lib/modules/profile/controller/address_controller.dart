import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/profile_repository.dart';
import 'package:hital_shop/backend/response/address_response.dart';

class AddressController extends GetxController {
  ProfileRespository respository = ProfileRespository();

  AddressResponse? addressResponse;

  void getAddress() async {
    addressResponse = null;
    update();
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

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
