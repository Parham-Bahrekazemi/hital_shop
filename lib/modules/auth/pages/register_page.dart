import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/textfield_widget.dart';
import 'package:hital_shop/modules/auth/controllers/register_controller.dart';
import 'package:hital_shop/modules/auth/pages/login_page.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (RegisterController controllers) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controllers.globalKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 62),
                          Image.asset(
                            'assets/images/logo_horizontal.png',
                            height: 45,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'به فروشگاه آنلاین خودتون خوش اومدید',
                            style: TextStyle(
                              color: Color(0xff8C8C8C),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'ثبت نام',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(height: 9),
                          TextFieldWidget(
                            hintText: 'نام و نام خانوادگی',
                            icon: Iconsax.user,
                            controller: controllers.textNameController,
                            validator: controllers.nameValidator,
                          ),
                          const SizedBox(height: 16),
                          TextFieldWidget(
                            hintText: 'شماره موبایل',
                            icon: Iconsax.mobile,
                            textInputType: TextInputType.number,
                            controller: controllers.textNumberController,
                            validator: controllers.mobileValidator,
                          ),
                          const SizedBox(height: 16),
                          TextFieldWidget(
                            hintText: 'رمز عبور',
                            textInputType: TextInputType.visiblePassword,
                            controller: controllers.textPasswordController,
                            validator: controllers.passwordValidator,
                          ),
                          const SizedBox(height: 16),
                          TextFieldWidget(
                            hintText: 'تکرار رمز عبور',
                            textInputType: TextInputType.visiblePassword,
                            controller:
                                controllers.textConfirmPasswordController,
                            validator: controllers.passwordConfirmValidator,
                          ),
                          const SizedBox(height: 34.5),
                          ButtonWidget(
                            title: 'ثبت نام',
                            onPressed: () {
                              controllers.register();
                            },
                            loading: controllers.loading,
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('حساب کاربری دارید ؟ '),
                              GestureDetector(
                                onTap: () {
                                  Get.off(const LoginPage());
                                },
                                child: Text(
                                  'وارد شوید',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
