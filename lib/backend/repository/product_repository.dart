import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hital_shop/backend/models/product_model.dart';
import 'package:hital_shop/backend/repository/base_repository.dart';
import 'package:hital_shop/backend/response/cart_response.dart';
import 'package:hital_shop/backend/response/categories_response.dart';
import 'package:hital_shop/backend/response/dashboard_response.dart';
import 'package:hital_shop/backend/response/order_response.dart';
import 'package:hital_shop/backend/response/product_response.dart';
import 'package:hital_shop/backend/response/review_response.dart';

class ProductRepository extends BaseRepsitory {
  Future<DashboardResponse?> getDashboard() async {
    Response response = await dio.get('/dashboard');

    return DashboardResponse.fromJson(response.data);
  }

  Future<CategoriesResponse>? getCategories() async {
    Response response = await dio.get('/categories');

    return CategoriesResponse.fromJson(response.data);
  }

  Future<ProductResponse>? getFilterProducts({
    int? categoryId,
    String? keyword,
    String? orderColumn,
    String? orderType,
  }) async {
    Map<String, dynamic> params = <String, dynamic>{
      if (categoryId != null) 'category_id': categoryId.toString(),
      if (keyword != null) 'keyword': keyword,
      if (orderColumn != null) 'order_column': orderColumn,
      if (orderType != null) 'order_type': orderType,
    };
    Response response = await dio.get(
      '/products',
      queryParameters: params,
    );

    return ProductResponse.fromJson(response.data);
  }

  Future<ProductModel> getProductDetail(int id) async {
    Response response = await dio.get(
      '/products/$id',
    );

    return ProductModel.fromJson(response.data['data']);
  }

  Future<ReviewResponse> getRiview(int id) async {
    Response response = await dio.get(
      '/product/$id/reviews',
    );

    return ReviewResponse.fromJson(response.data);
  }

  Future<bool> postComment(
      {required int productId,
      required int rate,
      required String comment}) async {
    Map<String, dynamic> params = <String, dynamic>{
      "product_id": productId,
      "rate": rate,
      "comment": comment,
    };
    Response response = await dio.post(
      '/review',
      data: params,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> addToCart({
    required int productId,
    required bool increment,
    bool delete = false,
  }) async {
    var response = await dio.post(
      '/add-to-cart',
      data: {
        "product_id": productId.toString(),
        if (delete == false) "increment": increment,
        'delete': delete,
      },
    );

    print(response.data);

    if (response.statusCode == 200) {
      if (response.data['count'] == null) {
        return 0;
      } else {
        return response.data['count'];
      }
    } else {
      return 0;
    }
  }

  Future<CartResponse> getCart() async {
    var response = await dio.get('/cart');

    return CartResponse.fromJson(response.data);
  }

  Future<String> order({
    required int addressId,
    required int shippingMethod,
  }) async {
    var response = await dio.post(
      '/order',
      data: {
        'address_id': addressId,
        'shipping_method': shippingMethod,
        if (kIsWeb) 'platform': 'web'
      },
    );

    return response.data['payment_link'];
  }

  Future<OrderResponse> getOrders() async {
    var response = await dio.get('/order');

    return OrderResponse.fromJson(response.data);
  }
}
