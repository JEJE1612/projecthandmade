import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/presention/views/home_admin.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_login/login_bloc.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_login/login_state.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/forgetpassword.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/register_pagee.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class LoginPage extends StatelessWidget {
  static const String nameKey = "LoginPage";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var email = BlocProvider.of<LoginBloc>(context).email;
          var password = BlocProvider.of<LoginBloc>(context).password;
          var formkey = BlocProvider.of<LoginBloc>(context).formkey;
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: Form(
              key: BlocProvider.of<LoginBloc>(context).formkey,
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
                        // width: double.infinity,
                        //height: 45,
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
                                    } else if (value.length < 8) {
                                      return "password must be at least 8 characters";
                                    } else if (!value
                                        .contains(RegExp(r'[A-Z]'))) {
                                      return "Password contains at least one uppercase letter";
                                    } else if (!value
                                        .contains(RegExp(r'[a-z]'))) {
                                      return "Password contains at least one lowercase letter";
                                    }

                                    if (!value.contains(
                                        RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                      return "Password contains at least one special character";
                                    }
                                    return null;
                                  },
                                  controller: password,
                                  obscureText:
                                      LoginBloc.get(context).obscureText,
                                  cursorColor: textBlack,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
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
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswod(),
                            ));
                                               
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
                      Navigator.pushNamed(context, HomeAdmin.nameKey);
                      if (formkey.currentState!.validate()) {}
                    },
                    child: const CustomButtonAuth(
                      text: "login",
                    ),
                  ),
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

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      height: 45,
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 16, color: textWhite, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 12,
          ),
          getSvgIcon(AssetsData.arrowforward),
        ],
      ),
    );
  }
}
