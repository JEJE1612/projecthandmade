import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/dealetUse/dealt_user.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/edit_profail/profail.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/show_cat.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/show_user.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/add_catg.dart';

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
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: textWhite,
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: textWhite,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                "Hand made",
                style: TextStyle(
                    color: textBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              getSvgIcon(AssetsData.arrowright),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfailpageAdmin(),
                  ));
            },
            icon: getSvgIcon(AssetsData.profile),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CutomCardAdmin(
                image: "assets/images/box.png",
                name: " ADD Categoris",
                onTap: () {
                  Navigator.pushNamed(context, AddCatgries.nameKey);
                },
              ),
              CutomCardAdmin(
                image: "assets/images/delay.png",
                name: " show Categoris",
                onTap: () {
                  Navigator.pushNamed(context, ShowCatgroies.nameKey);
                },
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CutomCardAdmin(
                image: "assets/images/remove_3179884.png",
                name: " Remove Categoris",
                onTap: () {
                  Navigator.pushNamed(context, AddCatgries.nameKey);
                },
              ),
              CutomCardAdmin(
                image: "assets/images/man_4140037.png",
                name: " show user",
                onTap: () {
                  Navigator.pushNamed(context, ShowCatgroies.nameKey);
                },
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CutomCardAdmin(
                image: "assets/images/task-list_3090231.png",
                name: "Show Owner",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowAllOwner(),
                      ));
                },
              ),
              CutomCardAdmin(
                image: "assets/images/contact_8637607.png",
                name: "Remove user",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DealtAllUser(),
                      ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CutomCardAdmin extends StatelessWidget {
  const CutomCardAdmin({
    super.key,
    this.onTap,
    required this.image,
    required this.name,
  });
  final Function()? onTap;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            color: textBlack,
            elevation: 20,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
          Gap(10),
          Text(
            name,
            style: TextStyle(
                color: textBlack, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
