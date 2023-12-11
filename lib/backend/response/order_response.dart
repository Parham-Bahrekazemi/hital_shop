import 'package:hital_shop/backend/models/order_model.dart';

class OrderResponse {
  List<OrderModel>? data;

  OrderResponse({this.data});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderModel>[];
      json['data'].forEach((v) {
        data!.add(OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
