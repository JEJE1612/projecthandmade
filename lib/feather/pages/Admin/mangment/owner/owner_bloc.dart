import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/owner/owner_state.dart';

class ShowAllOwnerBloc extends Cubit<ShowAllownerState> {
  final TextEditingController searchword = TextEditingController();
  List allResult = [];
  List resultlist = [];

  ShowAllOwnerBloc() : super(LoadingState());

  void initialize() async {
    var data = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('name')
        .where('type', isEqualTo: 'user')
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
