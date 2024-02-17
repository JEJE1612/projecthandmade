import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/model/comment_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_state.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';

class CommentBloc extends Cubit<CommentState> {
  CommentBloc() : super(IninalSate());

  static CommentBloc get(context) => BlocProvider.of(context);
  var userUid = FirebaseAuth.instance.currentUser?.uid;
  CollectionReference prodect =
      FirebaseFirestore.instance.collection('prodect');
  final TextEditingController message = TextEditingController();
  UserModel? usermodel;

  Future<void> creatCommen(
      {required String prodectuid, required context}) async {
    CommentModel model = CommentModel(
      userid: userUid,
      prodectid: prodectuid,
      message: message.text,
      nameuser: BlocProvider.of<UserBloc>(context).usermodel!.name,
      imageuser: BlocProvider.of<UserBloc>(context).usermodel!.image,
      commentid: '',
    );
    try {
      DocumentReference docRef = await prodect
          .doc(prodectuid)
          .collection("comment")
          .add(model.toMap());

      await docRef.update({'commentid': docRef.id});
      emit(ScafullCreatComment());
    } catch (e) {
      emit(ErrorCreatComment(
        error: e.toString(),
      ));
    }
  }

  List<CommentModel> messages = [];

  void getComment({required String prodectuid}) {
    FirebaseFirestore.instance
        .collection('prodect')
        .doc(prodectuid)
        .collection("comment")
        .snapshots()
        .listen((event) {
      messages.clear();
      for (var element in event.docs) {
        messages.add(CommentModel.fromJson(element.data()));
      }
      emit(GetMessageScafull());
    });
  }

  void removeComment({
    required String prodectuid,
    required String commentUid,
  }) {
    FirebaseFirestore.instance
        .collection('prodect')
        .doc(prodectuid)
        .collection("comment")
        .doc(commentUid)
        .delete()
        .then((value) {
      emit(ScafullDealetComment());
    });
  }
}
