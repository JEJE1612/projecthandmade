import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/main_bottom_nav_screen.dart';
import 'package:handmade/feather/pages/Admin/presention/views/home_admin.dart';
import 'package:handmade/feather/pages/Admin/presention/views/home_owner.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_login/login_bloc.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_login/login_state.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/forgetpassword.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/register_pagee.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state is LoginSucssesState) {
          } else if (state is LoginFailureState) {
          } else if (state is LoginAsClint) {
            EasyLoading.showSuccess("Welcom back");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavBarScreen(),
                ),
                (route) => false);
          } else if (state is LoginAsConsltent) {
            EasyLoading.showSuccess("Welcom back");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homeowner(),
                ),
                (route) => false);
          } else if (state is LoginAsadmin) {
            EasyLoading.showSuccess("Welcom back");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeAdmin(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          var email = BlocProvider.of<LoginBloc>(context).email;
          var password = BlocProvider.of<LoginBloc>(context).password;
          var formkey = BlocProvider.of<LoginBloc>(context).formkey;

          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
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
                      )
                    ],
                  ),
                  const Gap(40),
                  CustomTextFormFaild(
                    keyboardType: TextInputType.emailAddress,
                    controll: email,
                    head: "Email",
                    hintText: "Enter Email",
                  ),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16,
                            color: grey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: textFieldBg,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  controller: password,
                                  obscureText:
                                      LoginBloc.get(context).obscureText,
                                  cursorColor: textBlack,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: const UnderlineInputBorder(),
                                    hintText: "Enter Password",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        LoginBloc.get(context).changepassWord();
                                      },
                                      icon: Icon(
                                        LoginBloc.get(context).icon,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(3),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetPasswod.nameKey);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      alignment: Alignment.topRight,
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  const Gap(40),
                  InkWell(
                      onTap: () {
                        LoginBloc.get(context).loginUser();
                      },
                      child: const CustomButtonAuth(text: "Login")),
                  const Gap(40),
                  Row(
                    children: [
                      const Text(
                        "Does not have an account yet?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Registerpage.nameKey);
                        },
                        child: const Text(
                          " Create One",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
