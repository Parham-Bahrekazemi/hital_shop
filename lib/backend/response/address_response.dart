import 'package:hital_shop/backend/models/address_model.dart';

class AddressResponse {
  List<AddressModel>? data;

  AddressResponse({this.data});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AddressModel>[];
      json['data'].forEach((v) {
        data!.add(new AddressModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
