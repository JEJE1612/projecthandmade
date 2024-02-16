import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:handmade/feather/pages/Admin/data/model/orders.dart';
import 'package:handmade/feather/pages/Admin/mangment/orders/ordersstate.dart';

class OrderBloc extends Cubit<OrdersState> {
  OrderBloc() : super(LoadingState());
  static OrderBloc get(context) => BlocProvider.of(context);
  num total = 0;
  String  texttotal ="";
  void findtotal(num price) {
    total += price;
    texttotal = total.toString();
    emit(Scafullfindtotal());
  }

  var uid = FirebaseAuth.instance.currentUser?.uid;
  Orders? orders;
  List<Orders> listorders = [];
  CollectionReference order = FirebaseFirestore.instance.collection('orders');
  void creatorder(
    String? productid,
    String? nameproduct,
    String? image,
    String? dicount,
    int? dicountprice,
    String? price,
  ) async {
    Orders model = Orders(
        productid: productid,
        discount: dicount,
        price: price,
        image: image,
        discountPrice: dicountprice,
        nameproduct: nameproduct,
        ownerId: "",
        userId: uid,
        title: '', 
        orderid: '');

    try {
      DocumentReference docRef = await order.add(model.toMap());

      await docRef.update({'orderuid': docRef.id});
    } catch (e) {
      emit(ErrorCreatorder());
    }
  }

  List ordershow = [];
  void getorders() async {
    ordershow.clear();
    emit(LodingGetordersState());
    await FirebaseFirestore.instance
        .collection('orders')
        .where("userId", isEqualTo: uid)
        .get()
        .then((value) {
      for (var element in value.docs) {
        ordershow.add(element);
        emit(ScafullGetordersstate());
      }
    }).catchError((e) {});
  }
Future<void> deleteOrders(String docId) async {
    
    EasyLoading.show();

    try {
      await order.doc(docId).delete();
      getorders();
      emit(SuccessDeleteorder());
      EasyLoading.dismiss();
    } catch (e) {
    }
  }
  void choosehowmanypace(String pace, String oruid, String image, String price,
      String puid, String name) async {
    FirebaseFirestore.instance.collection('orders').doc(oruid).set({
      "discount": pace,
      "discountPrice": 0,
      "image": image,
      "ownerid": "",
      "price": price,
      " orderuid": oruid,
      "  productid": puid,
      "title": name,
      "userId": uid,
    });
  }
}
