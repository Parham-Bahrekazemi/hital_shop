import 'package:hital_shop/backend/models/province_model.dart';

class ProvinceResponse {
  List<ProvinceModel>? data;

  ProvinceResponse({this.data});

  ProvinceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProvinceModel>[];
      json['data'].forEach((v) {
        data!.add(ProvinceModel.fromJson(v));
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
