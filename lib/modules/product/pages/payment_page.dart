import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/modules/product/controller/cart_controller.dart';
import 'package:hital_shop/modules/product/pages/order_complete_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('type=success')) {
              var uri = Uri.parse(request.url);

              Get.off(
                OrderCompletePage(
                  type: uri.queryParameters['type'] ?? '',
                  id: uri.queryParameters['id'] ?? '',
                ),
              );
              Get.find<CartController>().getCart();

              return NavigationDecision.prevent;
            }
            var uri = Uri.parse(request.url);

            Get.off(
              OrderCompletePage(
                type: uri.queryParameters['type'] ?? '',
                id: uri.queryParameters['id'] ?? '',
              ),
            );
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(link));
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
