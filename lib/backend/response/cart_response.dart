import 'package:hital_shop/backend/models/cart_model.dart';

class CartResponse {
  int? totalItems;
  String? price;
  String? discountPrice;
  String? totalPrice;
  List<CartModel>? items;

  CartResponse(
      {this.totalItems,
      this.price,
      this.discountPrice,
      this.totalPrice,
      this.items});

  CartResponse.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    price = json['price'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      items = <CartModel>[];
      json['items'].forEach((v) {
        items!.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_items'] = totalItems;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['total_price'] = totalPrice;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
