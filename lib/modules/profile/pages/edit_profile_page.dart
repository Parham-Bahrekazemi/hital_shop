import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/user_model.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/textfield_widget.dart';
import 'package:hital_shop/modules/profile/controller/edit_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: EditProfileController(userModel),
        builder: (EditProfileController controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  const AppbarWidget(
                    title: 'ویرایش پروفایل',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 22.5),
                    child: Form(
                      key: controller.globalKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            hintText: 'نام و نام خانوادگی',
                            controller: controller.textNameController,
                            validator: controller.nameValidator,
                          ),
                          const SizedBox(height: 16.5),
                          TextFieldWidget(
                            hintText: '۰۹۱۳۰۰۱۰۱۰۱',
                            visible: true,
                            controller: controller.textMobileController,
                          ),
                          const SizedBox(height: 16.5),
                          TextFieldWidget(
                            hintText: 'رمز عبور قبلی',
                            textInputType: TextInputType.visiblePassword,
                            controller: controller.textOlderPasswordController,
                            validator: controller.olderPasswordValidator,
                          ),
                          const SizedBox(height: 16.5),
                          TextFieldWidget(
                            hintText: 'رمز عبور جدید',
                            textInputType: TextInputType.visiblePassword,
                            controller: controller.textNewPasswordController,
                            validator: controller.passwordValidator,
                          ),
                          const SizedBox(height: 34.5),
                          ButtonWidget(
                            title: 'ویرایش',
                            onPressed: () {
                              controller.editProfile();
                            },
                            loading: controller.loading,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
