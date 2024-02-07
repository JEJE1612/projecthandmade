import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/data/model/catrg_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/catg_state.dart';
import 'package:image_picker/image_picker.dart';

class CatgBloc extends Cubit<CatgState> {
  CatgBloc() : super(InitalState());
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
      print('No image selected.');
      emit(ErrorGetImageCatrg());
    }
  }

  void uploadCatgrImage({
    required String text,
    required String date,
    required String postImage,
  }) {
    emit(LodingCreatCatg());

    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imagecatrg!.path).pathSegments.last}")
        .putFile(imagecatrg!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatCatrg(
          imagecat: value,
          dateTime: date,
          text: text,
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

  CollectionReference catgr = FirebaseFirestore.instance.collection('catg');
  void creatCatrg({
    required String text,
    String? postImge,
    required String dateTime,
    required String imagecat,
  }) async {
    CatroiesModel model = CatroiesModel(
      text: text,
      catoiesImage: postImge ?? "",
      dateTime: dateTime,
    );

    emit(LodingCreatCatgies());
    catg.clear();
    catgnumder.clear();

    try {
      DocumentReference docRef = await catgr.add(model.toMap());

      model.uId = docRef.id;

      await docRef.update({'docId': docRef.id});

      getSomeWork();

      emit(ScafullCreatCatgies());
    } catch (e) {
      emit(ErrorCreatCatgies());
      print("Error in creating addPhoto: ${e.toString()}");
    }
  }

  void getSomeWork() async {
    emit(LodingGetListCatroies());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('catg')
          .orderBy(
            "dateTime",
          )
          .get();

      for (var element in querySnapshot.docs) {
        catg.add(
            CatroiesModel.fromJson(element.data() as Map<String, dynamic>));
        catgnumder.add(element.id);
      }

      emit(ScafullGetListCatroies());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }
}
