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
  static const String nameKey = 'AddCatgries';
  const AddCatgries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatgBloc(),
      child: BlocConsumer<CatgBloc, CatgState>(
        listener: (context, state) {
          if (state is ScafullGetListCatroies) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var textcontroller = CatgBloc.get(context).text;
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
                        if (CatgBloc.get(context).imagecatrg != null &&
                            CatgBloc.get(context).text != null)
                          SafeArea(
                            child: InkWell(
                              onTap: () {
                                CatgBloc.get(context).uploadCatgrImage();
                              },
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
                            ),
                          )
                      ],
                    ),
                  ),
                  CustomTextFormFaild(
                    controll: textcontroller,
                    head: "Name ",
                    hintText: "Name category",
                    keyboardType: TextInputType.text,
                  ),
                  const Gap(20),
                  InkWell(
                    onTap: () {
                      CatgBloc.get(context).getimagecatrg();
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: textFieldBg,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                          child: Text(
                            "AddPhoto",
                            style: TextStyle(
                                fontSize: 16,
                                color: grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
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
                                fit: BoxFit.cover,
                              ),
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
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/box.png",
                              ),
                            ),
                            color: primary,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  const Divider(height: 20, thickness: 0.5, color: Colors.grey),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
