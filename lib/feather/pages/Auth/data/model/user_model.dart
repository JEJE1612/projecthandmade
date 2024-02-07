class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? type;
  String? image;
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uid,
    required this.type,
    required this.image,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    type = json['type'];
    image = json['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'type': type,
      'image': image,
    };
  }
}
