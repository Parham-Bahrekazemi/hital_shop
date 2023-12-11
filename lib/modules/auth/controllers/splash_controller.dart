import 'package:get/get.dart';
import 'package:hital_shop/helpers/user_helper.dart';
import 'package:hital_shop/modules/auth/pages/start_page.dart';
import 'package:hital_shop/modules/home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  SharedPreferences? sharedPreferences;

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void onInit() {
    initShared();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (sharedPreferences?.getString('token') != null) {
          Get.put<UserHelper>(
            UserHelper(
              sharedPreferences!.getString('token'),
            ),
          );
          Get.off(const HomePage());
        } else {
          Get.off(const StartPage());
        }
      },
    );
    super.onInit();
  }
}
