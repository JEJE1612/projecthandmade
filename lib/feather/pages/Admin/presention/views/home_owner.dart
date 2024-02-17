import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/feather/pages/Admin/mangment/owner/owner_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/owner/owner_state.dart';

class HomeOwner extends StatelessWidget {
  static const String nameKey = "HomeOwner";

  const HomeOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeOwnerBody();
  }
}

class HomeOwnerBody extends StatelessWidget {
  const HomeOwnerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowAllOwnerBloc(),
      child: BlocConsumer<ShowAllOwnerBloc, ShowAllownerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ShowAllOwnerBloc.get(context)
                .viewsConsultant[ShowAllOwnerBloc.get(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: primary,
              currentIndex: ShowAllOwnerBloc.get(context).currentindex,
              onTap: (value) async {
                if (value == 0) {
                  //  ProdectBloc.get(context).getProdect();
                  ShowAllOwnerBloc.get(context).changeBootomSheet(value);
                }
                ShowAllOwnerBloc.get(context).changeBootomSheet(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: getSvgIcon(AssetsData.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: getSvgIcon(AssetsData.ordericon),
                  label: "Order",
                ),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
                BottomNavigationBarItem(
                    icon: getSvgIcon(AssetsData.profile), label: "Profile"),
              ],
            ),
          );
        },
      ),
    );
  }
}
