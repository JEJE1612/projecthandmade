import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/model/comment_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_state.dart';

class CommentBloc extends Cubit<CommentState> {
  CommentBloc() : super(IninalSate());
  static CommentBloc get(context) => BlocProvider.of(context);
  CollectionReference prodect =
      FirebaseFirestore.instance.collection('prodect');
  final TextEditingController message = TextEditingController();
  Future<void> creatCommen({
    required String prodectuid,
    required String userid,
    required String nameuser,
    required String imageuser,
  }) async {
    CommentModel model = CommentModel(
      userid: userid,
      prodectid: prodectuid,
      message: message.text,
      nameuser: nameuser,
      imageuser: imageuser,
      commentid: '',
    );
    try {
      DocumentReference docRef = await prodect
          .doc(prodectuid)
          .collection("comment")
          .add(model.toMap());

      await docRef.update({'commentid': docRef.id});
    } catch (e) {}
  }
}
