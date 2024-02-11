import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:handmade/feather/pages/Admin/data/model/catrg_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/catg_state.dart';
import 'package:image_picker/image_picker.dart';

class CatgBloc extends Cubit<CatgState> {
  CatgBloc() : super(InitalState());
  static CatgBloc get(context) => BlocProvider.of(context);

  File? imagecatrg;
  ImagePicker picker = ImagePicker();

  void removeimagecatrg() {
    imagecatrg = File('');
    emit(RemoveImageCatrg());
  }

  Future<void> getimagecatrg() async {
    emit(LodingGetImageCatrg());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagecatrg = File(pickedFile.path);

      emit(ScafullGetImageCatrg());
    } else {
      emit(ErrorGetImageCatrg());
    }
  }

  void uploadCatgrImage() {
    EasyLoading.show();
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imagecatrg!.path).pathSegments.last}")
        .putFile(imagecatrg!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatCatrg(
          postImge: value,
        );
        emit(ScafullUploadcreatCatgState());
      }).catchError((e) {
        emit(ErrorUploadcreatCatgState());
      });
    }).catchError((e) {
      emit(ErrorUploadcreatCatgState());
    });
  }

  List<CatroiesModel> catg = [];
  List catgnumder = [];
  TextEditingController text = TextEditingController();

  CollectionReference catgr = FirebaseFirestore.instance.collection('catg');
  void creatCatrg({
    String? postImge,
  }) async {
    CatroiesModel model = CatroiesModel(
      text: text.text,
      catoiesImage: postImge ?? "",
    );

    emit(LodingCreatCatgies());
    catg.clear();
    catgnumder.clear();

    try {
      DocumentReference docRef = await catgr.add(model.toMap());

      await docRef.update({'uid': docRef.id});
      getCats();
      emit(ScafullCreatCatgies());
    } catch (e) {
      emit(ErrorCreatCatgies());
    }
  }

  List<CatroiesModel> catroiesList = [];

  Future<void> getCats() async {
    emit(LodingGetListCatroies());

    try {
      QuerySnapshot querySnapshot = await catgr.get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        CatroiesModel catroiesModel = CatroiesModel.fromJson(data);
        catroiesList.add(catroiesModel);
      }
      text.clear();
      removeimagecatrg();
      EasyLoading.dismiss();

      emit(ScafullGetListCatroies());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }

  Future<void> deleteCatroies(String docId) async {
    EasyLoading.show();

    try {
      await catgr.doc(docId).delete();
      getCats();
      emit(SuccessDeleteCatgies());
      EasyLoading.dismiss();
    } catch (e) {
      emit(ErrorDeleteCatgies());
    }
  }
}
