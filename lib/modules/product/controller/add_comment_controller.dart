import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/product_repository.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/product/controller/comment_controller.dart';

class AddCommentController extends GetxController {
  TextEditingController txtDescription = TextEditingController();
  final int productId;
  int rate = 1;

  ProductRepository repository = ProductRepository();

  AddCommentController(this.productId);

  bool loading = false;

  void onRate(double value) {
    rate = value.toInt();
    update();
  }

  void addComment() async {
    loading = true;
    update();
    var response = await repository.postComment(
      productId: productId,
      rate: rate,
      comment: txtDescription.text,
    );

    if (response) {
      Get.find<CommentController>().getReview();
      loading = false;
      update();
      Get.back();
      successMessage('نظر با موفقیت ارسال شد');
    } else {
      loading = false;
      update();
      errorMessage('نظر ارسال نشد');
    }
  }
}
