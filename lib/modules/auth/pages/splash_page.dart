import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/auth/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (SplashController controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/background.png',
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.45),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
