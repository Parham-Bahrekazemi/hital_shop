import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/scroll_hhelper.dart';
import 'package:hital_shop/helpers/theme_helper.dart';
import 'package:hital_shop/modules/auth/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainWidget());
}

SharedPreferences? sharedPreferences;

Future<void> initShared() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    initShared();
    return GetBuilder<ThemeHelper>(
      init: ThemeHelper(),
      builder: (ThemeHelper controller) {
        return Container(
          color: Colors.grey,
          child: Center(
            child: SizedBox(
              width: 600,
              child: GetMaterialApp(
                scrollBehavior: MyCustomScrollBehavior(),
                home: const SplashPage(),
                title: 'فروشگاه هیتال',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('fa', 'IR'),
                ],
                locale: const Locale('fa', 'IR'),
                theme: controller.defaultTheme,
              ),
            ),
          ),
        );
      },
    );
  }
}
