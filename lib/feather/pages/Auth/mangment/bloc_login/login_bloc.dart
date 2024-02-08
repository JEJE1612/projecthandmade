import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_login/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(InitalState());

  static LoginBloc get(context) => BlocProvider.of(context);

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var formkeyforget = GlobalKey<FormState>();
  bool obscureText = false;
  IconData icon = Icons.visibility_outlined;

  void changepassWord() {
    obscureText = !obscureText;
    icon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeIconSuffix());
  }

  Future<void> loginUser() async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then((value) {
        getUserType(
          uid: value.user!.uid,
        );
        emit(LoginSucssesState(
          uid: value.user!.uid,
        ));
        EasyLoading.dismiss();
      });
    } catch (error) {
      String errorMessage = "An error occurred during login.";

      if (error is FirebaseAuthException) {
        switch (error.code) {
          case "user-not-found":
            errorMessage = "Invalid email address. Please check and try again.";
            break;
          case "wrong-password":
            errorMessage = "Invalid password. Please check and try again.";
            break;
        }
      }
      EasyLoading.showError(errorMessage);
      emit(LoginFailureState());
    }
  }

  void resetPassword(String email, BuildContext context) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      Navigator.pop(context);
    });
    emit(Forgetpasswordstate());
  }

  Future<void> getUserType({required String uid}) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(uid)
          .get()
          .then((userData) {
        var userRole = userData['type'];
        if (userRole == 'Owner') {
          emit(LoginAsConsltent());
        } else if (userRole == 'admin') {
          emit(LoginAsadmin());
        } else {
          emit(LoginAsClint());
        }
      });
    } catch (e) {
      emit(LoginFailureState());
    }
  }
}
