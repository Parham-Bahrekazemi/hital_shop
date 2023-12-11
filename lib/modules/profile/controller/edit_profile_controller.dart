import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/user_model.dart';
import 'package:hital_shop/backend/repository/profile_repository.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/profile/controller/profile_controller.dart';
import 'package:hital_shop/modules/profile/pages/profile_page.dart';

class EditProfileController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController textNameController = TextEditingController();
  TextEditingController textMobileController = TextEditingController();
  TextEditingController textNewPasswordController = TextEditingController();
  TextEditingController textOlderPasswordController = TextEditingController();

  final UserModel userModel;

  bool loading = false;

  ProfileRespository respository = ProfileRespository();

  EditProfileController(this.userModel);

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا نام و نام خانوادگی خود را وارد کنید';
    }
    return null;
  }

  String? olderPasswordValidator(String? value) {
    if (value!.isEmpty && textNewPasswordController.text.isNotEmpty) {
      return 'لطفا رمز عبور قبلی خود را وارد کنید';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty && textOlderPasswordController.text.isNotEmpty) {
      return 'لطفا رمز عبور جدید را وارد کنید';
    }

    if (value.isNotEmpty && value.length < 8) {
      return 'رمز عبور باید بیشتر از هشت رقم باشد';
    }

    return null;
  }

  void editProfile() async {
    if (globalKey.currentState!.validate()) {
      loading = true;
      update();
      var response = await respository.postComment(
        name: textNameController.text,
        oldPassword: textOlderPasswordController.text,
        newPassword: textNewPasswordController.text,
      );
      if (response) {
        Get.find<ProfileController>().getProfile();

        loading = false;
        update();
      } else {
        loading = false;
        update();
      }
    }
  }

  @override
  void onInit() {
    textNameController.text = userModel.name ?? '';
    textMobileController.text = userModel.mobile ?? '';
    super.onInit();
  }
}
