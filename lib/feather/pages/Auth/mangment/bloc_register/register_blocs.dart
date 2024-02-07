import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    EasyLoading.show();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // Successfully created user, proceed with additional actions (if needed)
      creatSaveData();

      // Emit a state indicating successful user registration
      emit(ScafullCreatUserState());
    } catch (error) {
      String errorMessage = " Please check your data.";

      // Check for specific errors and customize the error message accordingly
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case "email-already-in-use":
            errorMessage =
                "The email address is already in use by another account.";
            break;
          case "weak-password":
            errorMessage =
                "The password provided is too weak. Please use a stronger password.";
            break;
          // Add more cases as needed
        }
      }

      // Show the user-friendly error message
      EasyLoading.showError(errorMessage);

      // Emit a state indicating error during user registration
      emit(ErrorCrestLodingState(error: errorMessage));
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
          "https://cdn.pixabay.com/photo/2014/04/03/10/44/avatar-311292_1280.png",
    );
    emit(SaveDataFireStoreLoding());
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(model.toMap());
      emit(SaveDataFireStoreScafull());
      EasyLoading.dismiss();
    } catch (e) {
      emit(SaveDataFireStoreerror(error: e.toString()));
    }
  }
}
