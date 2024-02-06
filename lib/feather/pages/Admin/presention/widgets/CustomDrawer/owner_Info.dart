import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/owner_avatar.dart';

class OwnerInfo extends StatelessWidget {
  final bool isCollapsed;

  const OwnerInfo({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCollapsed ? 74 : 100,
      width: double.infinity,
      padding: isCollapsed
          ? const EdgeInsets.symmetric(horizontal: 10)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isCollapsed
          ? IntrinsicHeight(
              child: Row(
                children: [
                  const Expanded(
                    child: OwnerAvatar(),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // name
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Ahmed",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: textBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        // username
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Am12200101",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: textBlack,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () async {
                        //await AdminBloc.get(context).signOut();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const Expanded(
                  child: OwnerAvatar(),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () async {
                      // await AdminBloc.get(context).signOut();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: primary,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
