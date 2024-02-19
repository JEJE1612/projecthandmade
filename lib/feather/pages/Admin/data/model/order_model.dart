class OrdersModel {
  String? productid;
  String? price;
  String? userName;
  String? userUid;
  String? userImage;
  String? ownerUid;
  String? productname;
  String? orderid;
  String? productimage;
  String? date;

  OrdersModel(
      {required this.productimage,
      required this.productid,
      required this.price,
      required this.userName,
      required this.userUid,
      required this.userImage,
      required this.ownerUid,
      required this.productname,
      required this.date,
      this.orderid});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];

    productimage = json['productimage'];
    productid = json['productid'];
    price = json['price'];
    userName = json['userName'];
    userUid = json['userUid'];
    userImage = json['userImage'];
    ownerUid = json["ownerUid"];
    productname = json["productname"];
    orderid = json["orderid"];
  }

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "productimage": productimage,
      "productid": productid,
      'price': price,
      "userName": userName,
      "userUid": userUid,
      "userImage": userImage,
      "ownerUid": ownerUid,
      "productname": productname,
      "orderid": orderid
    };
  }
}
