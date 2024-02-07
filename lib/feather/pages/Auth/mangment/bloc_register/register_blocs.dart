import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_register/register_state.dart';

class CreatAccount extends Cubit<CratAccountState> {
  CreatAccount() : super(InitalState());
  static CreatAccount get(context) => BlocProvider.of(context);
  String type = "user";
  bool isClient = true;
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  var formkey = GlobalKey<FormState>();

  changeIsAdmin() {
    isClient = !isClient;
    emit(ChangetypeState());
  }

  Future<void> userRegister() async {
    print("aaaaaaaaaaaaaaaaaa");
    emit(CreatUserLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      creatSaveData();
      emit(ScafullCreatUserState());
    } catch (e) {
      emit(ErrorCrestLodingState(error: "Error check your data"));
    }
  }

  Future<void> creatSaveData() async {
    UserModel? model = UserModel(
      type: type,
      email: email.text,
      name: name.text,
      phone: phone.text,
      uid: FirebaseAuth.instance.currentUser!.uid,
      image:
          "https://www.behance.net/gallery/148207527/3D-Avatars/modules/837188661",
    );
    emit(SaveDataFireStoreLoding());
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(model.toMap());
      emit(SaveDataFireStoreScafull());
    } catch (e) {
      emit(SaveDataFireStoreerror(error: e.toString()));
    }
  }
}
