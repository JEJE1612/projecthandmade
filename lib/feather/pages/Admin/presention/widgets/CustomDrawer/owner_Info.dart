import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/owner_avatar.dart';

class OwnerInfo extends StatelessWidget {
  final bool isCollapsed;

  const OwnerInfo({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        var model = UserBloc.get(context).usermodel;
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
                      Expanded(
                        child: OwnerAvatar(
                          image: model!.image!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // name
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${model.name}",
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: const TextStyle(
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
                                "${model.email}",
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: const TextStyle(
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
                    Expanded(
                      child: OwnerAvatar(
                        image: model!.image!,
                      ),
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
      },
    );
  }
}
