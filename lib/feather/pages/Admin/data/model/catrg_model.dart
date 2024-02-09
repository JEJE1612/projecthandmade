class CatroiesModel {
  String? text;
  String? catoiesImage;

  CatroiesModel({
    required this.text,
    required this.catoiesImage,
  });
  CatroiesModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    catoiesImage = json['catoiesImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'catoiesImage': catoiesImage,
    };
  }
}
