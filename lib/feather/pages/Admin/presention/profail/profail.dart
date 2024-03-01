import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_state.dart';
import 'package:handmade/feather/pages/Admin/presention/profail/edit_profail/ebit_profail_page.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/login_page.dart';
import 'package:handmade/feather/user/presentation/favourte/product/favorateprotect.dart';

class ProfailpageAdmin extends StatelessWidget {
  const ProfailpageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..getUserData(),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is ScafullsignOut) {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginPage.nameKey, (route) => false);
          }
        },
        builder: (context, state) {
          var model = UserBloc.get(context).usermodel;
          if (state is LodingGetUserData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: textWhite,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        const Gap(10),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    model?.image! ?? ""),
                                radius: 45,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                model?.name ?? "",
                                style: const TextStyle(
                                    color: textBlack,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, EditProfailAdmin.nameKey);
                                },
                                child: const Text(
                                  "Edit profile",
                                  style: TextStyle(
                                    color: primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                 
                  Expanded(
                    child: Container(
                      color: light,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              getSvgIcon(AssetsData.profile),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                model?.name ?? "",
                                style: const TextStyle(
                                  color: grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>FavourateprodectScreen()));
                                },
                            child: Row(
                              children: [
                                getSvgIcon(AssetsData.hearticon),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  "Wishlists",
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            children: [
                              getSvgIcon(AssetsData.phoneicon),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                model?.phone ?? "",
                                style: const TextStyle(
                                  color: grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            children: [
                              getSvgIcon(AssetsData.helpicon),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "Help",
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: grey,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "About",
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          InkWell(
                            onTap: () {
                              UserBloc.get(context).signOut();
                            },
                            child: Row(
                              children: [
                                getSvgIcon(AssetsData.logouticon),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  "Sign out",
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
