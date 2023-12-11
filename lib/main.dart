import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
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
        return GetMaterialApp(
          home: const SplashPage(),
          title: 'Hital Shop',
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
        );
      },
    );
  }
}
