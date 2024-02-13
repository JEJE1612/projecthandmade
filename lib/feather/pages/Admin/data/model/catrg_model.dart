class CatroiesModel {
  String? text;
  String? catoiesImage;
  String? uid;

  CatroiesModel({required this.text, required this.catoiesImage, this.uid});
  CatroiesModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    catoiesImage = json['catoiesImage'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'text': text,
      'catoiesImage': catoiesImage,
    };
  }
}
