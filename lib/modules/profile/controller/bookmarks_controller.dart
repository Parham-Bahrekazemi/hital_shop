import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/profile_repository.dart';
import 'package:hital_shop/backend/response/product_response.dart';

class BookmarksController extends GetxController {
  ProfileRespository respository = ProfileRespository();

  ProductResponse? productResponse;

  Future<void> getBookmarks() async {
    productResponse = await respository.getBookmarks();

    update();
  }

  void bookmarkDelete(int id) async {
    var response = await respository.bookmark(id);

    if (response) {
      productResponse!.data?.removeWhere((element) {
        return element.id == id;
      });
      update();
    }
  }

  @override
  void onInit() {
    getBookmarks();
    super.onInit();
  }
}
