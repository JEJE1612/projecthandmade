import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/bloc_catg.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/catg_state.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/custom_appbar.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/custom_drawer.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/hom_items_admin.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/show_cat.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/show_user.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/show_owner.dart';

class HomeAdmin extends StatefulWidget {
  static const String nameKey = "HomeAdmin";
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  static final GlobalKey<ScaffoldState> _scaffoldkey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: textWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          size: size,
          text: "Hand Made",
          onPressed: () {
            _scaffoldkey.currentState!.openDrawer();
          },
        ),
      ),
      body: ListView(
        children: [
          const Gap(20),
          BlocProvider(
            create: (context) => CatgBloc(),
            child: BlocBuilder<CatgBloc, CatgState>(
              builder: (context, state) {
                return HomeItemsAdmin(
                  text1: "Numder Categories:",
                  text2: "${CatgBloc.get(context).catroiesList.length}",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowCatgroies(),
                        ));
                  },
                );
              },
            ),
          ),
          HomeItemsAdmin(
            text1: "Numder User:",
            text2: "5",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowUser(),
                  ));
            },
          ),
          HomeItemsAdmin(
            text1: "Numder owner:",
            text2: "5",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowOwner(),
                  ));
            },
          ),
          const Column(
            children: [
              Card(
                elevation: 10,
                color: Colors.amberAccent,
                child: Image(
                  image: AssetImage(""),
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Gap(10),
              Text(
                "Categoris",
                style: TextStyle(
                    color: textBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
