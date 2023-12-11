import 'package:hital_shop/backend/models/review_model.dart';

class ReviewResponse {
  List<ReviewModel>? data;

  ReviewResponse({this.data});

  ReviewResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReviewModel>[];
      json['data'].forEach((v) {
        data!.add(ReviewModel.fromJson(v));
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
