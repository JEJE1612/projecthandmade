class CommentModel {
  String? userid;
  String? prodectid;
  String? message;
  String? nameuser;
  String? imageuser;
  String? commentid;

  CommentModel(
      {required this.userid,
      required this.prodectid,
      required this.message,
      required this.nameuser,
      required this.imageuser,
      this.commentid});
  CommentModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    prodectid = json['prodectid'];
    message = json['message'];
    nameuser = json['nameuser'];
    imageuser = json['imageuser'];
    commentid = json['commentid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'prodectid': prodectid,
      'message': message,
      'nameuser': nameuser,
      'imageuser': imageuser,
      'commentid': commentid,
    };
  }
}
