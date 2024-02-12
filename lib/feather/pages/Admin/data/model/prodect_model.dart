class ProdectModel {
  String? catgname;
  String? prodectImage;
  String? prodectuid;
  String? text;
  String? price;
  String? pace;
  String? date;
  String? uid;
  String? prodectname;

  ProdectModel({
    required this.catgname,
    required this.prodectImage,
    required this.text,
    required this.price,
    required this.pace,
    required this.date,
    required this.uid,
    required this.prodectname,
    this.prodectuid,
  });

  ProdectModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    catgname = json['catgname'];
    prodectImage = json['prodectImage'];
    price = json['price'];
    pace = json['pace'];
    date = json['date'];
    prodectuid = json['prodectuid'];
    uid = json['uid'];
    prodectname = json['prodectname'];
  }
  Map<String, dynamic> toMap() {
    return {
      'prodectname': prodectname,
      'text': text,
      'catgname': catgname,
      'prodectImage': prodectImage,
      'price': price,
      'pace': pace,
      'date': date,
      'prodectuid': prodectuid,
      'uid': uid,
    };
  }
}
