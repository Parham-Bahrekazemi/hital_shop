class AddressModel {
  int? id;
  String? title;
  String? address;
  int? postalCode;
  String? latlong;
  String? city;
  String? province;
  int? cityId;
  int? provinceId;

  AddressModel(
      {this.id,
      this.title,
      this.address,
      this.postalCode,
      this.latlong,
      this.city,
      this.province,
      this.cityId,
      this.provinceId});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    postalCode = json['postal_code'];
    latlong = json['latlong'];
    city = json['city'];
    province = json['province'];
    cityId = json['city_id'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['address'] = this.address;
    data['postal_code'] = this.postalCode;
    data['latlong'] = this.latlong;
    data['city'] = this.city;
    data['province'] = this.province;
    data['city_id'] = this.cityId;
    data['province_id'] = this.provinceId;
    return data;
  }
}
