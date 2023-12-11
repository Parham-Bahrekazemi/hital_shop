import 'package:hital_shop/backend/models/product_model.dart';

class CartModel {
  int? count;
  ProductModel? product;

  CartModel({this.count, this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
