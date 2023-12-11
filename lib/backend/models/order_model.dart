import 'package:hital_shop/backend/models/product_model.dart';

class OrderModel {
  String? trackingCode;
  String? totalPrice;
  String? status;
  String? address;
  List<ProductModel>? products;

  OrderModel(
      {this.trackingCode,
      this.totalPrice,
      this.status,
      this.address,
      this.products});

  OrderModel.fromJson(Map<String, dynamic> json) {
    trackingCode = json['tracking_code'];
    totalPrice = json['total_price'];
    status = json['status'];
    address = json['address'];
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tracking_code'] = trackingCode;
    data['total_price'] = totalPrice;
    data['status'] = status;
    data['address'] = address;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
