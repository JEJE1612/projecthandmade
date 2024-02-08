import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_state.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(InitalState());
  static UserBloc get(context) => BlocProvider.of(context);
  UserModel? usermodel;

  void getUserData() {
    emit(LodingGetUserData());
    FirebaseFirestore.instance
        .collection('user')
        .doc("XIeszeDVJ4ND7oVXUrbEoP77hjs1")
        .get()
        .then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = UserModel.fromJson(data);
          emit(ScafullGetUserData());
        } else {
          emit(HomeErrorStata("Data is null"));
        }
      } else {
        emit(HomeErrorStata("Document does not exist"));
      }
    }).catchError((e) {
      emit(ErrorGetUserData(e.toString()));
    });
  }

  ImagePicker picker = ImagePicker();
  File? image;

  Future<void> getImageProfail() async {
    emit(LodingGetProfailImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      emit(ScafullGetProfailImage());
    } else {
      debugPrint('No image selected.');
      emit(ErrorGetProfailImage());
    }
  }

  void udateAdminData({
    required String name,
    required String phone,
    required String bio,
    String? image,
  }) {
    EasyLoading.show();
    UserModel model = UserModel(
      name: name,
      email: usermodel!.email,
      phone: phone,
      uid: usermodel!.uid,
      type: usermodel!.type,
      image: image ?? usermodel!.image,
    );

    FirebaseFirestore.instance
        .collection("user")
        .doc(usermodel?.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(ScafullUdateAdminData());
    }).catchError((eror) {
      emit(ErrorUdateAdminData());
      debugPrint(eror.toString());
    });
  }

  void uploadprofialImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingUploadImageProfailState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(image!.path).pathSegments.last}")
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadImageProfailState());
        debugPrint(value);
        udateAdminData(
          name: name!,
          phone: phone!,
          bio: bio!,
          image: value,
        );
        debugPrint(value);
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      debugPrint(e.toString());
      emit(ErrorUploadImageProfailState());
    });
  }
}
