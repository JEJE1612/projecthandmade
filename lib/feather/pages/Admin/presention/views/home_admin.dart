import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/custom_appbar.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/custom_drawer.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/hom_items_admin.dart';

class HomeAdmin extends StatelessWidget {
  static const String nameKey = "HomeAdmin";

  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textWhite,
      appBar: PreferredSize(
        child: MainAppBar(size: size),
        preferredSize: const Size.fromHeight(80),
      ),
      body: ListView(
        children: const [
          Gap(20),
          HomeItemsAdmin(
            text1: "Numder Categories:",
            text2: "5",
          ),
          HomeItemsAdmin(
            text1: "Numder User:",
            text2: "5",
          ),
          HomeItemsAdmin(
            text1: "Numder owner:",
            text2: "5",
          )
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
