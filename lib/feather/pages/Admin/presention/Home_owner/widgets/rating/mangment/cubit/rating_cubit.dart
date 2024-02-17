import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/data/model/reating_model.dart';
import 'package:handmade/feather/user/management/bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());
  final ratingController = TextEditingController();
  final ratingKey = GlobalKey<FormState>();
  double ratingValue = 0.0;
  Future<void> addRating(BuildContext context, {required String uid}) async {
    emit(RatingLoading());
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    try {
      await rating.doc(rating.doc().id).set(
        {
          "uid": uid,
          kDescribeRating: ratingController.text,
          kRateValue: ratingValue.toString(),
          kUserName: BlocProvider.of<MyBloc>(context).usermodel!.name,
          kImage: BlocProvider.of<MyBloc>(context).usermodel!.image,
          "dateTime": DateTime.now(),
          "documentId": rating.doc().id,
        },
      );
      emit(AddSucess());
    } on Exception catch (e) {
      emit(RatingFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateRate(RatingModel rate) async {
    emit(RatingLoading());
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    try {
      await rating.doc(rate.documentId).update({
        "dateTime": DateTime.now(),
        kRateValue: ratingValue.toString(),
        kDescribeRating: ratingController.text,
        kUserName: rate.userName,
        "documentId": rate.documentId,
        kImage: rate.image,
        'uid': rate.uid,
      });
      await getAllRating(uidd: "");
    } on Exception catch (e) {
      emit(RatingFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deleteRate({required String documentId}) async {
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    try {
      await rating.doc(documentId).delete();
      await getAllRating(uidd: "");
    } on Exception catch (e) {
      emit(RatingFailure(errorMessage: e.toString()));
    }
  }

  // MyBloc.get(context).listshowAllConsltant[widget.i]['uid'],
  Future<void> getAllRating({required String uidd}) async {
    emit(RatingLoading());
    CollectionReference rating =
        FirebaseFirestore.instance.collection("rating");
    List<RatingModel> allRating = [];
    try {
      await rating
          .orderBy("dateTime", descending: true)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          if (data["uid"] == uidd) {
            allRating.add(RatingModel.fromjson(rate: data));
          }
        });
      });
      emit(RatingSucess(allRating: allRating));
    } on Exception catch (e) {
      emit(RatingFailure(errorMessage: e.toString()));
    }
  }
}
