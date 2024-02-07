import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_register/register_blocs.dart';
import 'package:handmade/feather/pages/Auth/mangment/bloc_register/register_state.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/login_page.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/custom_text_formfaild.dart';

class Registerpage extends StatelessWidget {
  static const String nameKey = "Registerpage";
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CreatAccount(),
      child: BlocConsumer<CreatAccount, CratAccountState>(
        listener: (context, state) {},
        builder: (context, state) {
          var formkey = BlocProvider.of<CreatAccount>(context).formkey;
          var email = BlocProvider.of<CreatAccount>(context).email;
          var password = BlocProvider.of<CreatAccount>(context).password;
          var name = BlocProvider.of<CreatAccount>(context).name;
          var phone = BlocProvider.of<CreatAccount>(context).phone;
          var isCleint = BlocProvider.of<CreatAccount>(context).isClient;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Form(
                key: BlocProvider.of<CreatAccount>(context).formkey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.11,
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
                    const Gap(25),
                    CustomTextFormFaild(
                      controll: name,
                      head: "Name",
                      hintText: "Enter name",
                    ),
                    const Gap(20),
                    CustomTextFormFaild(
                      controll: email,
                      head: "Email",
                      hintText: "Enter Email",
                    ),
                    const Gap(20),
                    CustomTextFormFaild(
                      controll: phone,
                      head: "phone",
                      hintText: "Enter phone",
                    ),
                    const Gap(20),
                    CustomTextFormFaild(
                      controll: password,
                      head: "password",
                      hintText: "Enter password",
                    ),
                    const Gap(10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RadioListTile(
                            activeColor: primary,
                            autofocus: true,
                            selected: !isCleint,
                            title: const Text('Owner'),
                            value: 'Owner',
                            onChanged: (value) {
                              BlocProvider.of<CreatAccount>(context).type =
                                  value!;
                              CreatAccount.get(context).changeIsAdmin();
                            },
                            groupValue: isCleint ? null : 'Owner',
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            selected: isCleint,
                            title: const Text('user'),
                            value: "user",
                            groupValue: isCleint ? "user" : null,
                            onChanged: (value) {
                              BlocProvider.of<CreatAccount>(context).type =
                                  value!;
                              CreatAccount.get(context).changeIsAdmin();
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gap(40),
                    IconButton(
                        onPressed: () {
                          CreatAccount.get(context).userRegister();
                        },
                        icon: Icon(Icons.add)),
                    InkWell(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {}
                      },
                      child: CustomButtonAuth(
                        text: "Create",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
