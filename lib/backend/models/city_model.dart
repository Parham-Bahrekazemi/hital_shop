class CityModel {
  int? id;
  String? name;
  int? provinceId;

  CityModel({this.id, this.name, this.provinceId});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['province_id'] = provinceId;
    return data;
  }
}
