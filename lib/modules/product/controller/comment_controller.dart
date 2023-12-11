import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/backend/response/review_response.dart';

class CommentController extends GetxController {
  ProductRepository repository = ProductRepository();

  ReviewResponse? reviewResponse;

  final int id;

  CommentController(this.id);

  void getReview() async {
    reviewResponse = null;
    update();
    reviewResponse = await repository.getRiview(id);
    reviewResponse!.data = reviewResponse?.data?.reversed.toList();
    update();
  }

  @override
  void onInit() {
    getReview();
    super.onInit();
  }
}
