import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/owner/owner_state.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/views/home_owner.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/views/chat.dart';
import 'package:handmade/feather/pages/Admin/presention/Order/order_page.dart';
import 'package:handmade/feather/pages/Admin/presention/profail/profail.dart';

class ShowAllOwnerBloc extends Cubit<ShowAllownerState> {
  ShowAllOwnerBloc() : super(LoadingState());
  static ShowAllOwnerBloc get(context) => BlocProvider.of(context);

  final TextEditingController searchword = TextEditingController();

  List allOwner = [];
  List resultlist = [];

  void initialize() async {
    var data = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('name')
        .where('type', isEqualTo: 'Owner')
        .get();
    allOwner = data.docs;
    searchResultList();
    emit(LoadedState(resultlist));
  }

  void searchResultList() {
    var showResult = [];
    if (searchword.text != '') {
      for (var userSnapshot in allOwner) {
        var name = userSnapshot['name'].toString().toLowerCase();
        if (name.contains(searchword.text.toLowerCase())) {
          showResult.add(userSnapshot);
        }
      }
    } else {
      showResult = List.from(allOwner);
    }
    resultlist = showResult;
    emit(LoadedState(resultlist));
  }

  int currentindex = 0;

  List<Widget> viewsConsultant = [
    const HomeOwnerpage(),
    const OrderPage(),
    const ChatPage(),
    const ProfailpageAdmin(),
  ];

  void changeBootomSheet(int index) {
    currentindex = index;
    emit(ChangeBottonSheet());
  }
}
