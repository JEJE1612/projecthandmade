import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/search_prodect/mangment/seach_prodect_state.dart.dart';

class SearchProdetCubit extends Cubit<SearchProdetState> {
  final TextEditingController searchword = TextEditingController();
  List allResult = [];
  List resultlist = [];

  SearchProdetCubit() : super(LoadingState());

  void initialize() async {
    var data = await FirebaseFirestore.instance
        .collection('prodect')
        .orderBy('prodectname')
        .get();
    allResult = data.docs;
    searchResultList();
    emit(LoadedState(resultlist));
  }

  void searchResultList() {
    var showResult = [];
    if (searchword.text != '') {
      for (var userSnapshot in allResult) {
        var name = userSnapshot['prodectname'].toString().toLowerCase();
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
