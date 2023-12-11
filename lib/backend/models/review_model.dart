class ReviewModel {
  int? id;
  String? comment;
  double? rate;
  String? reply;
  String? user;
  String? date;

  ReviewModel(
      {this.id, this.comment, this.rate, this.reply, this.user, this.date});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    rate = json['rate'].toDouble();
    reply = json['reply'];
    user = json['user'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['comment'] = comment;
    data['rate'] = rate;
    data['reply'] = reply;
    data['user'] = user;
    data['date'] = date;
    return data;
  }
}
