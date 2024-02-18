class Product {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  
  String? image;
  int? stock;
  double? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.title,
    this.shortDes,
    this.price,
    this.discount,
    this.discountPrice,
    this.image,
    this.stock,
    this.star,
    this.remark,
    this.categoryId,
    this.brandId,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "shortDes": shortDes,
      'price': price,
      "discount": discount,
      "discountPrice": discountPrice,
      "image": image,
      "stock": stock,
      "star": star,
      "remark": remark,
      "categoryId": categoryId,
      "brandId": brandId,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
