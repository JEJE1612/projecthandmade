import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:handmade/feather/pages/Admin/data/favprodect.dart';
import 'package:handmade/feather/pages/Admin/data/model/catrg_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/presention/car_prodect_view.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/views/chat.dart';
import 'package:handmade/feather/pages/Admin/presention/profail/profail.dart';
import 'package:handmade/feather/pages/Admin/presention/views/home_custum_user.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';
import 'package:handmade/feather/user/management/my_state.dart';

class MyBloc extends Cubit<MyState> {
  MyBloc() : super(InitalMyState());
  static MyBloc get(context) => BlocProvider.of(context);
  int currentSelectedIndex = 0;
  UserModel? usermodel;
  var uid = FirebaseAuth.instance.currentUser?.uid;
  final List<Widget> screens = [
    const HomeCustomUser(),
    const ChatPage(),
    const CarProdectPage(),
    const ProfailpageAdmin(),
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
    }).catchError((e) {});
  }

  List catroies = [];
  List<String> catroiesnum = [];

  void getCaroies() async {
    catroies.clear();
    catroiesnum.clear();

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

  List product = [];

  void getProducttouser() async {
    emit(LodingGetcatroiesState());
    FirebaseFirestore.instance.collection('prodect').get().then((value) {
      for (var element in value.docs) {
        product.add(element);
        emit(ScafullGetcatroiesstate());
      }
    }).catchError((e) {});
  }

  CollectionReference favprodect =
      FirebaseFirestore.instance.collection('favproduct');
  DateTime time = DateTime.now();
  void creatfavProdect(
    String? favprodectImage,
    String? catgname,
    String? title,
    String? descipton,
    String? price,
    String? favuid,
    String? paces,
  ) async {
    FavProdectModel model = FavProdectModel(
        prodectuid: '',
        prodectname: title,
        catgname: catgname,
        prodectImage: favprodectImage,
        text: descipton,
        price: price,
        pace: paces,
        date: time.toString(),
        uid: favuid,
        useruid: uid);

    try {
      DocumentReference docRef = await favprodect.add(model.toMap());

      await docRef.update({'prodectuid': docRef.id});

      emit(SucessfulCreatProdect());
    } catch (e) {}
  }

  List getfavprodect = [];

  void getfavourateProducttouser() async {
    emit(LodingGetcatroiesState());
    FirebaseFirestore.instance
        .collection('favproduct')
        .where("userid", isEqualTo: uid)
        .get()
        .then((value) {
      for (var element in value.docs) {
        getfavprodect.add(element);
        emit(ScafullGetcatroiesstate());
      }
    }).catchError((e) {});
  }

  Future<void> deleteProdect(String docId) async {
    getfavprodect.clear();
    EasyLoading.show();

    try {
      await favprodect.doc(docId).delete();
      getfavourateProducttouser();
      EasyLoading.dismiss();
      emit(SuccessDeletefavProect());
    } catch (e) {}
  }
}
