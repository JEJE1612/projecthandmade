import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/user/management/my_state.dart';
import 'package:handmade/feather/user/presentation/cart/cart_screen.dart';
import 'package:handmade/feather/user/presentation/categoreys/categories_screen.dart';
import 'package:handmade/feather/user/presentation/homeuser.dart';
import 'package:handmade/feather/user/presentation/wish_list_screen.dart';

class MyBloc extends Cubit<MyState> {
  MyBloc() : super(InitalState());
  static MyBloc get(context) => BlocProvider.of(context);
  int currentSelectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreenUser(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  void onChanged(int index) {
    currentSelectedIndex = index;
    emit(ChangeBottonSheet());
  }

  void backToHomeScreen() {
    onChanged(0);
    emit(ChangeBottonSheet());
  }
}
