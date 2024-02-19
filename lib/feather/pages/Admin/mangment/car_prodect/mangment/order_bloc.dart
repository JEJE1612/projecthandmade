import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/data/model/order_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/car_prodect/mangment/order_state.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(IninalSate());
  static OrderCubit get(context) => BlocProvider.of(context);
  DateTime date = DateTime.now();
  var userUid = FirebaseAuth.instance.currentUser?.uid;

  CollectionReference prodect = FirebaseFirestore.instance.collection('cars');

  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  Future<void> creatCar({
    required BuildContext context,
    required String productid,
    required String price,
    required String ownerUid,
    required String productname,
    required String productimage,
  }) async {
    OrdersModel model = OrdersModel(
        date: date.toString(),
        productimage: productimage,
        productid: productid,
        price: price,
        userName: BlocProvider.of<UserBloc>(context).usermodel!.name,
        userUid: userUid,
        userImage: BlocProvider.of<UserBloc>(context).usermodel!.image,
        ownerUid: ownerUid,
        productname: productname,
        orderid: '');

    try {
      DocumentReference docRef = await prodect.add(model.toMap());

      await docRef.update({'orderid': docRef.id});
      emit(ScafullCreatorder());
    } catch (e) {
      emit(ErrorCreatOrderCar(error: e.toString()));
    }
  }

  Future<void> creatOrders({
    required BuildContext context,
    required String productid,
    required String price,
    required String ownerUid,
    required String productname,
    required String productimage,
  }) async {
    OrdersModel model = OrdersModel(
        date: date.toString(),
        productimage: productimage,
        productid: productid,
        price: price,
        userName: BlocProvider.of<UserBloc>(context).usermodel!.name,
        userUid: userUid,
        userImage: BlocProvider.of<UserBloc>(context).usermodel!.image,
        ownerUid: ownerUid,
        productname: productname,
        orderid: '');

    try {
      DocumentReference docRef = await orders.add(model.toMap());

      await docRef.update({'orderid': docRef.id});
      emit(ScafullCreatorder());
    } catch (e) {
      emit(ErrorCreatOrderCar(error: e.toString()));
    }
  }

  List<OrdersModel> order = [];
  void getOrders() {
    FirebaseFirestore.instance
        .collection('cars')
        .where('userUid', isEqualTo: userUid)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> event) {
      order.clear();
      for (var element in event.docs) {
        order.add(OrdersModel.fromJson(element.data()));
        print(order);
      }

      emit(GetOrderUserScafull());
    });
  }

  List<OrdersModel> orderOwner = [];
  void getOrdersOwner() {
    FirebaseFirestore.instance
        .collection('orders')
        .orderBy("date")
        .where('ownerUid', isEqualTo: userUid)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> event) {
      orderOwner.clear();
      for (var element in event.docs) {
        orderOwner.add(OrdersModel.fromJson(element.data()));
      }

      emit(GetOrderUserScafull());
    });
  }

  void removeCar({
    required String orderId,
  }) {
    FirebaseFirestore.instance
        .collection('cars')
        .doc(orderId)
        .delete()
        .then((value) {
      emit(ScafullDealetCarProdect());
    });
  }
}
