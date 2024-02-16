class Orders {
  String? productid;
  String? price;
  String? discount;
  
  String? title;
  int? discountPrice;
  String? image;
  String? ownerId;
  String? nameproduct;
  String? userId;

  Orders({
    required this.productid,
    required this.price,
    required this.title,
    required this.discount,
    required this.discountPrice,
    required this.image,
    required this.ownerId,
    required this.nameproduct,
    required this.userId,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    ownerId = json["ownerId"];
    userId = json["userId"];
    userId = json["title"];

  }

  Map<String, dynamic> toMap() {
    return {
      "productid": productid,
      'price': price,
      "discount": discount,
      "discountPrice": discountPrice,
      "image": image,
      "ownerid": ownerId,
      "userId":userId,
      "title":title
    };
  }
}
