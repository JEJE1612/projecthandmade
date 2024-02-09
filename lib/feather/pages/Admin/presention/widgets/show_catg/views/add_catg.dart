import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/bloc_catg.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/catg_state.dart';

import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class AddCatgries extends StatelessWidget {
  const AddCatgries({super.key});

  @override
  Widget build(BuildContext context) {
    // var textControll = TextEditingController();
    return BlocProvider(
      create: (context) => CatgBloc(),
      child: BlocConsumer<CatgBloc, CatgState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding,
                  left: leftMainPadding,
                  right: rightMainPadding),
              child: Column(
                children: [
                  Container(
                    color: textWhite,
                    height: 80,
                    child: Row(
                      children: [
                        const Text(
                          "Add catroies",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        getSvgIcon(AssetsData.arrowright),
                        const Spacer(),
                        SafeArea(
                          child: Container(
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                "save",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textWhite,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomTextFormFaild(
                    controll: TextEditingController(),
                    head: "Name ",
                    hintText: "Name category",
                    keyboardType: TextInputType.text,
                  ),
                  const Gap(20),
                  if (CatgBloc.get(context).imagecatrg != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: FileImage(
                                      CatgBloc.get(context).imagecatrg!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              CatgBloc.get(context).removeimagecatrg();
                            },
                            icon: const CircleAvatar(
                              child: Icon(
                                Icons.close_rounded,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  if (CatgBloc.get(context).imagecatrg == null)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 50),
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Pleas choose photo!!",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const Divider(height: 20, thickness: 0.5, color: Colors.grey),
                  CircleAvatar(
                    backgroundColor: primary,
                    radius: 30,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            CatgBloc.get(context).getimagecatrg();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 34,
                            color: Colors.white,
                          )),
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
