import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_register/register_state.dart';

class CreatAccount extends Cubit<CratAccountState> {
  CreatAccount() : super(InitalState());
  static CreatAccount get(context) => BlocProvider.of(context);
  // String type = "client";
  // bool isClient = true;
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  var formkey = GlobalKey<FormState>();
  // changeIsAdmin() {
  //   isClient = !isClient;
  //   emit(ChangetypeState());
  // }

  // Future<void> userRegister() async {
  //   emit(CreatUserLoadingState());
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email.text,
  //       password: password.text,
  //     );
  //     creatSaveData();
  //     emit(ScafullCreatUserState());
  //   } catch (e) {
  //     emit(ErrorCrestLodingState(error: "Error check your data"));
  //   }
  // }

  // Future<void> creatSaveData() async {
  //   UserModel? model = UserModel(
  //     type: type,
  //     email: email.text,
  //     name: name.text,
  //     phone: phone.text,
  //     uid: FirebaseAuth.instance.currentUser!.uid,
  //     bio: "writebio.",
  //     cover:
  //         "https://images.pexels.com/photos/268941/pexels-photo-268941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  //     image:
  //         "https://images.pexels.com/photos/5588224/pexels-photo-5588224.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  //   );
  //   emit(SaveDataFireStoreLoding());
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("user")
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .set(model.toMap());
  //     emit(SaveDataFireStoreScafull());
  //   } catch (e) {
  //     emit(SaveDataFireStoreerror(error: e.toString()));
  //   }
  // }
}
