class ProductModel {
  int? id;
  String? title;
  String? image;
  String? price;
  String? realPrice;
  int? discountPercent;
  String? description;
  String? category;
  int? reviewsCount;
  bool? bookmark;
  int? cartCount;
  int? count;

  List<String>? gallery;

  ProductModel({
    this.id,
    this.title,
    this.image,
    this.price,
    this.realPrice,
    this.discountPercent,
    this.description,
    this.category,
    this.gallery,
    this.bookmark,
    this.cartCount,
    this.count,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    realPrice = json['real_price'];
    discountPercent = json['discount_percent'];
    description = json['description'];
    category = json['category'];
    if (json['gallery'] != null) gallery = json['gallery'].cast<String>();
    reviewsCount = json['reviews_count'];
    bookmark = json['bookmarked'];
    cartCount = json['cart_count'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['real_price'] = realPrice;
    data['discount_percent'] = discountPercent;
    return data;
  }
}
