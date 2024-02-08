import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/dealetUse/mangment/dealt_all_user_state.dart.dart';

class DealtAllUserCubit extends Cubit<DealtAllUserState> {
  final TextEditingController searchword = TextEditingController();
  List allResult = [];
  List resultlist = [];

  DealtAllUserCubit() : super(LoadingState());

  void initialize() async {
    var data = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('name')
        .get();
    allResult = data.docs;
    searchResultList();
    emit(LoadedState(resultlist));
  }

  void searchResultList() {
    var showResult = [];
    if (searchword.text != '') {
      for (var userSnapshot in allResult) {
        var name = userSnapshot['name'].toString().toLowerCase();
        if (name.contains(searchword.text.toLowerCase())) {
          showResult.add(userSnapshot);
        }
      }
    } else {
      showResult = List.from(allResult);
    }
    resultlist = showResult;
    emit(LoadedState(resultlist));
  }
}
