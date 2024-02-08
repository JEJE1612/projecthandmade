import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

import 'package:handmade/feather/pages/Auth/presentaion/views/forgetpassword.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class EditProfailAdmin extends StatefulWidget {
  const EditProfailAdmin({super.key});

  @override
  State<EditProfailAdmin> createState() => _EditProfailState();
}

class _EditProfailState extends State<EditProfailAdmin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is ScafullUdateAdminData) {
          EasyLoading.showSuccess("Success edit profail");
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var model = UserBloc.get(context).usermodel;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: leftMainPadding, right: rightMainPadding),
                child: Column(
                  children: [
                    const CustomAppBar(
                      text: "EditProfail",
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: UserBloc.get(context).image == null
                              ? CachedNetworkImageProvider(model!.image!)
                              : FileImage(UserBloc.get(context).image!)
                                  as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  UserBloc.get(context).getImageProfail();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 30,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    CustomTextFormFaild(
                      controll: nameController,
                      head: "Name",
                      hintText: model?.name ?? '',
                      keyboardType: TextInputType.name,
                    ),
                    const Gap(20),
                    CustomTextFormFaild(
                      controll: phoneController,
                      head: "phone",
                      hintText: model?.phone ?? '',
                      keyboardType: TextInputType.phone,
                    ),
                    const Gap(10),
                    const Gap(30),
                    InkWell(
                      onTap: () {
                        if (UserBloc.get(context).image != null) {
                          UserBloc.get(context).uploadprofialImage(
                            name: nameController.text.isNotEmpty
                                ? nameController.text
                                : model?.name ?? "Admin",
                            phone: phoneController.text.isNotEmpty
                                ? phoneController.text
                                : model?.phone ?? "00",
                          );
                        }
                        UserBloc.get(context).udateUserData(
                          name: nameController.text.isNotEmpty
                              ? nameController.text
                              : model?.name ?? "ahmed",
                          phone: phoneController.text.isNotEmpty
                              ? phoneController.text
                              : model?.phone ?? "00000000",
                        );
                      },
                      child: const CustomButtonAuth(
                        text: "Save",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
