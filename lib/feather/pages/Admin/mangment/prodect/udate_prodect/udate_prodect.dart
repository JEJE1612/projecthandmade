import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/udate_prodect/udate_prodect_sate.dart';

class UdateProdectBloc extends Cubit<UdateProdetState> {
  UdateProdectBloc() : super(IninalSate());
  static UdateProdectBloc get(context) => BlocProvider.of(context);
  final TextEditingController title = TextEditingController();
  final TextEditingController descipton = TextEditingController();
  final TextEditingController paces = TextEditingController();
  final TextEditingController price = TextEditingController();
  DateTime time = DateTime.now();
  var uid = FirebaseAuth.instance.currentUser?.uid;
  CollectionReference prodect =
      FirebaseFirestore.instance.collection('prodect');

  void updateProdect({
    required String prodectUid,
    String? prodectImage,
    String? catgname,
    String? titlefrom,    
    String? desciptionfrom,    
    String? pricefrom,
    String? pacefrom,
  }) async {
    emit(LodingUpdateProdect());

    ProdectModel updatedModel = ProdectModel(
      prodectuid: prodectUid,
      prodectname: title.text =="" ?titlefrom!:title.text,
      catgname: catgname,
      prodectImage: prodectImage,
      text: descipton.text==""?desciptionfrom!:descipton.text,
      price: price.text ==""?pricefrom!:price.text ,
      pace: paces.text==""?pacefrom!:paces.text,
      date: time.toString(),
      uid: uid,
    );

    try {
      await prodect.doc(prodectUid).update(updatedModel.toMap());
      emit(SuccessUpdateProdect());
    } catch (e) {
      emit(ErrorUpdateProdect(e.toString()));
    }
  }
}
