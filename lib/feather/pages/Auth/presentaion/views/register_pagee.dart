import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/login_page.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class Registerpage extends StatelessWidget {
  static const String nameKey = "Registerpage";
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Form(
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.12,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hand Made",
                    style: TextStyle(
                        color: primary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Gap(40),
              CustomTextFormFaild(
                controll: TextEditingController(),
                head: "Name",
                hintText: "Enter name",
              ),
              const Gap(20),
              CustomTextFormFaild(
                controll: TextEditingController(),
                head: "Email",
                hintText: "Enter Email",
              ),
              const Gap(20),
              CustomTextFormFaild(
                controll: TextEditingController(),
                head: "phone",
                hintText: "Enter phone",
              ),
              const Gap(20),
              CustomTextFormFaild(
                controll: TextEditingController(),
                head: "password",
                hintText: "Enter password",
              ),
              const Gap(40),
              InkWell(
                onTap: () {},
                child: const CustomButtonAuth(
                  text: "Create",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
