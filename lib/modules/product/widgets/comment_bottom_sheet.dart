import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/product/controller/add_comment_controller.dart';
import 'package:iconsax/iconsax.dart';

class ShowModalBottemSheet extends StatelessWidget {
  const ShowModalBottemSheet({super.key, required this.productid});
  final int productid;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCommentController>(
      init: AddCommentController(productid),
      builder: (AddCommentController controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.16),
                    blurRadius: 6,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ارسال نظر',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Center(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: RatingBar.builder(
                        unratedColor: const Color(0xffEDEDED),
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Iconsax.star1,
                          color: Color(0xffF4D42D),
                        ),
                        onRatingUpdate: (rating) {
                          controller.onRate(rating);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 23),
                  TextFormField(
                    controller: controller.txtDescription,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xffE1E1E1),
                          width: 1,
                        ),
                      ),
                      hintText: 'نظر خود را وارد کنید',
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 12),
                  ButtonWidget(
                    title: 'ارسال نظر',
                    onPressed: () {
                      controller.addComment();
                    },
                    loading: controller.loading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
