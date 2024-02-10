import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/data/model/catrg_model.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';
import 'package:handmade/feather/user/management/my_state.dart';
import 'package:handmade/feather/user/presentation/cart/cart_screen.dart';
import 'package:handmade/feather/user/presentation/categoreys/categories_screen.dart';
import 'package:handmade/feather/user/presentation/chat/chat.dart';
import 'package:handmade/feather/user/presentation/homeuser.dart';
import 'package:handmade/feather/user/presentation/wish_list_screen.dart';

class MyBloc extends Cubit<MyState> {
  MyBloc() : super(InitalMyState());
  static MyBloc get(context) => BlocProvider.of(context);
  int currentSelectedIndex = 0;
  UserModel? usermodel;

  final List<Widget> screens = [
    const HomeScreenUser(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishListScreen(),
   const Chatscreen()
  ];

  void onChanged(int index) {
    currentSelectedIndex = index;
    emit(ChangeBottonSheet());
  }

  void backToHomeScreen() {
    onChanged(0);
    emit(ChangeBottonSheet());
  }

  Future<void> getUserData() async {
    emit(LoudingGetUserData());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = UserModel.fromJson(data);
          emit(ScassfullGetUserData());
        } else {
          emit(ErrorGetUserDatau());
        }
      } else {
        emit(HomeuserErrorStata());
      }
    }).catchError((e) {
      
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
    }).catchError((e) {});
  }
  
  List catroiesuser = [];

 void getCaroiestouser() async {
    emit(LodingGetcatroiesState());
    FirebaseFirestore.instance.collection('catg').get().then((value) {
      for (var element in value.docs) {
        catroiesuser.add(CatroiesModel.fromJson(element.data()));
        emit(ScafullGetcatroiesstate());
      }
    }).catchError((e) {});
  }
}
