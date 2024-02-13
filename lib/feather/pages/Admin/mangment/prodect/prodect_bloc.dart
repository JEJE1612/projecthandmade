import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:image_picker/image_picker.dart';

import 'prodect_state.dart';

class ProdectBloc extends Cubit<ProdectState> {
  ProdectBloc() : super(LoadingState());
  static ProdectBloc get(context) => BlocProvider.of(context);

  final TextEditingController title = TextEditingController();
  final TextEditingController descipton = TextEditingController();
  final TextEditingController paces = TextEditingController();
  final TextEditingController price = TextEditingController();
  var uid = FirebaseAuth.instance.currentUser?.uid;
  DateTime time = DateTime.now();
  ProdectModel? prodectModel;
  List<ProdectModel> listProdect = [];
  CollectionReference prodect =
      FirebaseFirestore.instance.collection('prodect');
  void creatProdect({
    String? prodectImage,
    required String catgname,
  }) async {
    ProdectModel model = ProdectModel(
        prodectuid: '',
        prodectname: title.text,
        catgname: catgname,
        prodectImage: prodectImage,
        text: descipton.text,
        price: price.text,
        pace: paces.text,
        date: time.toString(),
        uid: uid);

    try {
      DocumentReference docRef = await prodect.add(model.toMap());

      await docRef.update({'prodectuid': docRef.id});
    } catch (e) {
      emit(ErrorCreatProdect());
    }
  }

  List<ProdectModel> prodects = [];

  Future<void> getProdect() async {
    emit(LodingGetListprodects());

    try {
      QuerySnapshot querySnapshot = await prodect.get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        ProdectModel catroiesModel = ProdectModel.fromJson(data);
        prodects.add(catroiesModel);
        print("${prodects.length}hjkggggggggggggg");
      }

      emit(ScafullGetListCatroies());
    } catch (e) {
      debugPrint("Error in getAsk: $e");
    }
  }

  File? imageProdect;
  ImagePicker picker = ImagePicker();
  void removeimagecatrg() {
    imageProdect = File('');
    emit(RemoveimageProdect());
  }

  Future<void> getimagecatrg() async {
    emit(LodingGetimageProdect());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageProdect = File(pickedFile.path);

      emit(ScafullGetimageProdect());
    } else {
      emit(ErrorGetimageProdect());
    }
  }

  // void chooseMyCategory(String mychoose ,{required String  uid}) {
  //   FirebaseFirestore.instance
  //       .collection('prodect')
  //       .doc(uid)
  //       .set({'category': mychoose}, SetOptions(merge: true)).then((value) {
  //     //Do your stuff.
  //   });
  // }

  void uploadimageProdect({
    required String catgname,
  }) {
    emit(LodingCreatProdect());
    prodects.clear();
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imageProdect!.path).pathSegments.last}")
        .putFile(imageProdect!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatProdect(
          prodectImage: value,
          catgname: '',
        );
        getProdect();
        emit(ScafullUploadprodectImage());
      }).catchError((e) {
        emit(ErrorUploadcreatprodectImage());
      });
    }).catchError((e) {
      emit(ErrorUploadprodectImage());
    });
  }

  List catroies = [];
  List<String> catroiesnum = [];

  void getCaroies() async {
    catroies.clear();
    catroiesnum.clear();
    emit(LodingGetcatroiesState());
    await FirebaseFirestore.instance.collection('catg').get().then((value) {
      for (var element in value.docs) {
        catroies.add(element);
        catroiesnum.add(element.id);
        emit(ScafullGetcatroiesstate());
      }
    }).catchError((e) {
      emit(ErrorGetcatroiesstate());
    });
  }
}
