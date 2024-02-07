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
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class ForgetPasswod extends StatelessWidget {
  static const String nameKey = "ForgetPasswordPage";

  const ForgetPasswod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ForgetPasswodBody();
  }
}

class ForgetPasswodBody extends StatelessWidget {
  const ForgetPasswodBody({
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
          var formkeyforget = BlocProvider.of<LoginBloc>(context).formkeyforget;
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
                        "ForgetPassword",
                        style: TextStyle(
                            color: primary,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Gap(60),
                  CustomTextFormFaild(
                    keyboardType: TextInputType.emailAddress,
                    controll: email,
                    head: "Email",
                    hintText: "Enter Email",
                  ),
                  const Gap(30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HomeAdmin.nameKey);
                      if (formkeyforget.currentState!.validate()) {}

                      LoginBloc.get(context).resetPassword(email.text, context);
                    },
                    child: const CustomButtonAuth(
                      text: "Send",
                    ),
                  ),
                  const Gap(40),
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
