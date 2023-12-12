import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/repository/auth_repository.dart';
import 'package:hital_shop/backend/repository/base_repository.dart';
import 'package:hital_shop/backend/response/register_response.dart';
import 'package:hital_shop/helpers/user_helper.dart';
import 'package:hital_shop/modules/home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController textNameController = TextEditingController();
  TextEditingController textNumberController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController textConfirmPasswordController = TextEditingController();

  SharedPreferences? sharedPreferences;

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool loading = false;

  final AuthRepository authRepository = AuthRepository();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا نام خود را وارد کنید';
    }
    return null;
  }

  String? mobileValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا شماره موبایل خود را وارد کنید';
    }
    if (value.length < 11 || value.length > 11) {
      return 'شماره موبایل باید یازده رقم باشد';
    }
    if (!RegExp(r'^09[0|1|2|3][0-9]{8}$').hasMatch(value)) {
      return 'لطفا شماره موبایل معتبر وارد کنید';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا رمز عبور خود را وارد کنید';
    }
    if (value.length < 8) {
      return 'رمز عبور باید بیشتر از هشت رقم باشد';
    }

    return null;
  }

  String? passwordConfirmValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا تکرار رمز عبور خود را وارد کنید';
    }
    if (value != textPasswordController.text) {
      return 'رمز عبور و تکرار رمز عبور باید  یکسان باشد';
    }

    return null;
  }

  void register() async {
    if (globalKey.currentState!.validate()) {
      loading = true;
      update();

      RegisterResponse? response = await authRepository.register(
        name: textNameController.text,
        mobile: textNumberController.text,
        password: textPasswordController.text,
        passwordConfirmation: textConfirmPasswordController.text,
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
