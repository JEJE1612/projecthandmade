import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/feather/user/management/bloc.dart';
import 'package:handmade/feather/user/management/my_state.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: MyBloc.get(context)
                  .screens[MyBloc.get(context).currentSelectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: MyBloc.get(context).currentSelectedIndex,
                unselectedItemColor: Colors.grey,
                selectedItemColor: primary,
                elevation: 4,
                onTap: (value) {
                  if (value == 1) {
                    MyBloc.get(context).onChanged(value);
                  } else if (value == 2) {
                    MyBloc.get(context).onChanged(value);
                  } else {
                    MyBloc.get(context).onChanged(value);
                  }
                },
                items: [
                  BottomNavigationBarItem(
                    icon: getSvgIcon(AssetsData.home),
                    label: "Home",
                  ),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: "Car",
                  ),
                  BottomNavigationBarItem(
                      icon: getSvgIcon(AssetsData.profile), label: "Profile"),
                ],
              ));
        });
  }
}
