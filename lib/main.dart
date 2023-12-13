import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/scroll_hhelper.dart';
import 'package:hital_shop/helpers/theme_helper.dart';
import 'package:hital_shop/modules/auth/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
