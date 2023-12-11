import 'package:hital_shop/backend/models/categories_model.dart';

class CategoriesResponse {
  List<CategoriesModel>? data;

  CategoriesResponse({this.data});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoriesModel>[];
      json['data'].forEach((v) {
        data!.add(CategoriesModel.fromJson(v));
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
