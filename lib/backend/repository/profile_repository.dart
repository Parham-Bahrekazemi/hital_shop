import 'package:get/get.dart';
import 'package:hital_shop/backend/models/user_model.dart';
import 'package:hital_shop/backend/repository/base_repository.dart';

import 'package:hital_shop/backend/response/address_response.dart';
import 'package:hital_shop/backend/response/product_response.dart';
import 'package:hital_shop/backend/response/province_response.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';

class ProfileRespository extends BaseRepsitory {
  Future<UserModel> getProfile() async {
    var response = await dio.get('/profile');

    print('profile code : ${response.statusCode}');

    return UserModel.fromJson(response.data['data']);
  }

  Future<bool> postComment({
    required String? name,
    required String? oldPassword,
    required String? newPassword,
  }) async {
    Map<String, dynamic> params = <String, dynamic>{
      "name": name,
      if (oldPassword != null && oldPassword.isNotEmpty)
        "old_password": oldPassword,
      if (newPassword != null && newPassword.isNotEmpty)
        "new_password": newPassword,
    };
    var response = await dio.post(
      '/profile',
      data: params,
    );

    if (response.statusCode == 200) {
      Get.back();
      successMessage(response.data['message']);

      return true;
    }
    if (response.statusCode == 400) {
      errorMessage(response.data['message']);
      return false;
    } else {
      errorMessage('پروفایل ویرایش نشد');
      return false;
    }
  }

  Future<ProvinceResponse> getProvince() async {
    var response = await dio.get('/provinces');

    return ProvinceResponse.fromJson(response.data);
  }

  Future<bool> addAddress({
    required String title,
    required int cityId,
    required String address,
    String? postalCode,
    String? latlong,
  }) async {
    var response = await dio.post(
      '/address',
      data: {
        'title': title,
        'city_id': cityId.toString(),
        'address': address,
        'postal_code': postalCode,
        'latlong': latlong,
      },
    );

    return response.statusCode == 200;
  }

  Future<bool> editAddress({
    required int id,
    required String title,
    required int cityId,
    required String address,
    String? postalCode,
    String? latlong,
  }) async {
    var response = await dio.put(
      '/address/$id',
      data: {
        'title': title,
        'city_id': cityId.toString(),
        'address': address,
        'postal_code': postalCode,
        'latlong': latlong,
      },
    );

    return response.statusCode == 200;
  }

  Future<AddressResponse> getAddress() async {
    var response = await dio.get(
      '/address',
    );

    return AddressResponse.fromJson(response.data);
  }

  Future<bool> deleteAddress(int id) async {
    var response = await dio.delete(
      '/address/$id',
    );

    if (response.statusCode == 200) {
      successMessage(response.data['message']);
      return true;
    } else {
      errorMessage(response.data['message']);
      return false;
    }
  }

  Future<bool> bookmark(int id) async {
    var response = await dio.post('/product/$id/bookmark');
    if (response.statusCode == 200) {
      successMessage(response.data['message']);
      return true;
    } else {
      errorMessage(response.data['message']);
      return false;
    }
  }

  Future<ProductResponse> getBookmarks() async {
    var response = await dio.get('/bookmarks');

    return ProductResponse.fromJson(response.data);
  }
}
