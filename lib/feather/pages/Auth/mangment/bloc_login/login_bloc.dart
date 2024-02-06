import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_login/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(InitalState());
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var formkey = GlobalKey<FormState>();
  static LoginBloc get(context) => BlocProvider.of(context);

  bool obscureText = false;
  IconData icon = Icons.visibility_outlined;

  void changepassWord() {
    obscureText = !obscureText;
    icon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeIconSuffix());
  }

  Future<void> loginUser() async {
    emit(LodingLoginState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        emit(LoginSucssesState(
          uid: value.user!.uid,
        ));
      });
    } catch (e) {
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

        if (userRole == 'consulting') {
          emit(LoginAsConsltent());
        } else {
          emit(LoginAsClint());
        }
      });
    } catch (e) {
      emit(LoginFailureState());
    }
  }
}
