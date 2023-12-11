import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/textfield_widget.dart';
import 'package:hital_shop/modules/auth/controllers/login_controller.dart';
import 'package:hital_shop/modules/auth/pages/register_page.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (LoginController controller) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.globalKey,
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
                            'ورود',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        TextFieldWidget(
                          hintText: 'شماره موبایل',
                          icon: Iconsax.mobile,
                          textInputType: TextInputType.number,
                          controller: controller.textNumberController,
                          validator: controller.mobileValidator,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          hintText: 'رمز عبور',
                          textInputType: TextInputType.visiblePassword,
                          controller: controller.textPasswordController,
                          validator: controller.passwordValidator,
                        ),
                        const SizedBox(height: 34.5),
                        ButtonWidget(
                          title: 'ورود',
                          onPressed: () {
                            controller.login();
                          },
                          loading: controller.loading,
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('حساب کاربری ندارید ؟ '),
                            GestureDetector(
                              onTap: () {
                                Get.off(const RegisterPage());
                              },
                              child: Text(
                                'ثبت نام',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
