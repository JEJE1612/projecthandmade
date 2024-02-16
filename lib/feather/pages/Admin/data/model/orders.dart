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
  String? orderid;
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
    required this.orderid,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    ownerId = json["ownerId"];
    userId = json["userId"];
    orderid = json["orderuid"];

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
      "title":title,
      "orderuid":orderid
      
    };
  }
}
