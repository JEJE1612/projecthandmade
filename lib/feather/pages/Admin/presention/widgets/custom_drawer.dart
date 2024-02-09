import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/custom_drawer_header.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/custom_list_tile.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/owner_info.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/dealetUse/dealt_user.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/edit_profail/ebit_profail_page.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/add_catg.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 500),
      width: _isCollapsed ? 300 : 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: textFieldBg,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            CustomDrawerHeader(
              isCollapsable: _isCollapsed,
              image: UserBloc.get(context).usermodel!.image!,
              name: UserBloc.get(context).usermodel!.name!,
            ),
            const Center(
              child: Text(
                " catg",
                style: TextStyle(
                    color: primary, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(color: Colors.grey),
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.category_outlined,
              title: 'Add category',
              infoCount: 0,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCatgries(),
                    ));
              },
            ),
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.delete_outline,
              title: 'remove category',
              infoCount: 0,
              onTap: () {},
            ),
            const Gap(5),
            const Center(
              child: Text(
                "User",
                style: TextStyle(
                    color: primary, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(color: Colors.grey),
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.person_remove,
              title: 'remove user',
              infoCount: 0,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DealtAllUser(),
                    ));
              },
            ),
            const Gap(5),
            const Center(
              child: Text(
                "profail",
                style: TextStyle(
                    color: primary, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(color: Colors.grey),
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.person,
              title: 'Edit Profail',
              infoCount: 0,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfailAdmin(),
                    ));
              },
            ),
            OwnerInfo(
              isCollapsed: _isCollapsed,
              //  model: AdminBloc.get(context).usermodel!,
            ),
            Align(
              alignment:
                  _isCollapsed ? Alignment.bottomRight : Alignment.bottomCenter,
              child: IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  _isCollapsed ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                  color: primary,
                  size: 16,
                ),
                onPressed: () {
                  setState(() {
                    _isCollapsed = !_isCollapsed;
                  });
                },
              ),
            ),
          ]
              .map(
                (e) => Padding(
                  padding: e is Drawer
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(top: 10),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
