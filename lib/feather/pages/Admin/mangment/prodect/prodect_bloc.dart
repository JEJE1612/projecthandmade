import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:handmade/feather/pages/Admin/data/model/orders.dart';
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
    String? catgname,
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
      await docRef.update({'catgname': catgname});
    } catch (e) {
      emit(ErrorCreatProdect());
    }
  }

  List<ProdectModel> prodects = [];

  Future<void> getProdect() async {
    emit(LodingGetListprodects());
    prodects.clear();

    try {
      QuerySnapshot querySnapshot = await prodect.get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        ProdectModel catroiesModel = ProdectModel.fromJson(data);
        prodects.add(catroiesModel);
      }

      emit(ScafullGetListCatroies());
    } catch (e) {
      debugPrint("Error in getAsk: $e");
    }
  }

  List<ProdectModel> prodectsCustomOwner = [];
  void getProdectCustomOwner() {
    FirebaseFirestore.instance
        .collection('prodect')
        .orderBy("date")
        .where('uid', isEqualTo: uid)
        .snapshots()
        .listen((event) {
      prodectsCustomOwner.clear();
      for (var element in event.docs) {
        prodectsCustomOwner.add(ProdectModel.fromJson(element.data()));
      }
      emit(GetProdectModelScafull());
    });
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

  void chooseMyCategory(String mychoose, {required String prodectUid}) {
    FirebaseFirestore.instance
        .collection('prodect')
        .doc(prodectUid)
        .set({'catgname': mychoose}, SetOptions(merge: true)).then((value) {});
  }

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
      value.ref.getDownloadURL().then((value) async {
        creatProdect(
          prodectImage: value,
          catgname: catgname,
        );
        await getProdect();
        emit(ScafullUploadprodectImage());
      }).catchError((e) {
        emit(ErrorUploadcreatprodectImage());
      });
    }).catchError((e) {
      emit(ErrorUploadprodectImage());
    });
  }

  Future<void> deleteProdect(String docId) async {
    EasyLoading.show();

    try {
      await prodect.doc(docId).delete();
      getProdectCustomOwner();
      emit(SuccessDeleteProect());

      EasyLoading.dismiss();
    } catch (e) {
      emit(ErrorDeleteProdect(e.toString()));
    }
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

  Orders? orders;
  List<Orders> listorders = [];
  CollectionReference order = FirebaseFirestore.instance.collection('orders');
  void creatorder(
    String? productid,
    String? nameproduct,
    String? image,
    int? dicountprice,
    String? price,
    String? title,
  ) async {
    Orders model = Orders(
        productid: productid,
        price: price,
        image: image,
        discountPrice: dicountprice,
        nameproduct: nameproduct,
        ownerId: "",
        userId: uid,
        title: title,
        discount: '',
        orderid: '');

    try {
      emit(LodingCreatorderp());
      DocumentReference docRef = await order.add(model.toMap());

      await docRef.update({'orderuid': docRef.id});

      emit(ScafullCreatorders());
    } catch (e) {}
  }
}
