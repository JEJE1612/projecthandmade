import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_state.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

import 'package:handmade/feather/pages/Auth/presentaion/views/forgetpassword.dart';

class EditProfailAdmin extends StatefulWidget {
  const EditProfailAdmin({super.key});

  @override
  State<EditProfailAdmin> createState() => _EditProfailState();
}

class _EditProfailState extends State<EditProfailAdmin> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController jodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = UserBloc.get(context).usermodel;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CustomAppBar(
                      text: "EditProfail",
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          CachedNetworkImageProvider(model!.image!),
                    ),
                    Gap(10),
                    InkWell(
                      onTap: () {
                        // AdminBloc.get(context).udateAdminData(
                        //   name: nameController.text.isNotEmpty
                        //       ? nameController.text
                        //       : AdminBloc.get(context).usermodel?.name ?? "",
                        //   phone: phoneController.text.isNotEmpty
                        //       ? phoneController.text
                        //       : AdminBloc.get(context).usermodel?.phone ?? "",
                        //   bio: bioController.text.isNotEmpty
                        //       ? bioController.text
                        //       : AdminBloc.get(context).usermodel?.bio ?? "",
                        // );
                      },
                      child: CustomButtonAuth(
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
