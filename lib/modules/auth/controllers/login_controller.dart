import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/auth_repository.dart';
import 'package:hital_shop/backend/response/register_response.dart';
import 'package:hital_shop/helpers/user_helper.dart';
import 'package:hital_shop/modules/home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController textNumberController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  SharedPreferences? sharedPreferences;

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool loading = false;

  final AuthRepository authRepository = AuthRepository();

  String? mobileValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا شماره موبایل خود را وارد کنید';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا رمز عبور خود را وارد کنید';
    }
    return null;
  }

  void login() async {
    if (globalKey.currentState!.validate()) {
      loading = true;
      update();
      RegisterResponse? response = await authRepository.login(
        mobile: textNumberController.text,
        password: textPasswordController.text,
      );
      if (response != null) {
        sharedPreferences!.setString('token', response.token!);
        Get.put<UserHelper>(
          UserHelper(
            sharedPreferences!.getString('token'),
          ),
        );
        Get.to(const HomePage());
      }
      loading = false;
      update();
    }
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}
