import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/custom_drawer_header.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/custom_list_tile.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/owner_Info.dart';

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
              // model: AdminBloc.get(context).usermodel,
            ),
            const Divider(color: Colors.grey),
            //MangmentCatroies
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.note_add_outlined,
              title: 'Add Categories',
              infoCount: 0,
              onTap: () {},
            ),

            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.visibility_outlined,
              title: 'Show Categories',
              infoCount: 0,
              onTap: () {},
            ),
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.delete_outline,
              title: 'Delete Categories',
              infoCount: 0,
              onTap: () {},
            ),

            const Divider(color: Colors.grey),

            //Mangment Consultant
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.supervised_user_circle_sharp,
              title: 'Show Consultant',
              infoCount: 0,
              onTap: () {},
            ),
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.person_2_outlined,
              title: 'Show User',
              infoCount: 0,
              onTap: () {},
            ),
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.contact_support_outlined,
              title: 'Contact Us',
              infoCount: 0,
              onTap: () {},
            ),

            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.delete_outline,
              title: 'Delete User',
              infoCount: 0,
              onTap: () {},
            ),

            const Divider(color: Colors.grey),

            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.person_2_outlined,
              title: 'Profile',
              infoCount: 0,
              onTap: () {},
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
