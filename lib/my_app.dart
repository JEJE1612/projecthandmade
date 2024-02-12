import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/mangment/catg/bloc_catg.dart';
import 'package:handmade/feather/pages/Admin/mangment/owner/owner_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/views/home_admin.dart';
import 'package:handmade/feather/pages/Admin/presention/profail/edit_profail/ebit_profail_page.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/show_user.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/remove_catg.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/show_cat.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/views/add_catg.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/forgetpassword.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/login_page.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/register_pagee.dart';
import 'package:handmade/feather/pages/onbording_page/onbording.dart';
import 'package:handmade/feather/pages/splach_screen/presentaion/views/splach.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc()..getUserData(),
        ),
        BlocProvider(
          create: (context) => CatgBloc()..getCats(),
        ),
        BlocProvider(
          create: (context) => ShowAllOwnerBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'HandMade',
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        initialRoute: SplashView.nameKey,
        builder: EasyLoading.init(),
        theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: primary,
          ),
          elevation: 0,
          selectedItemColor: primary,
          unselectedItemColor: grey,
        )),
        routes: {
          SplashView.nameKey: (_) => const SplashView(),
          Onborording.nameKey: (_) => const Onborording(),
          LoginPage.nameKey: (_) => const LoginPage(),
          Registerpage.nameKey: (_) => const Registerpage(),
          HomeAdmin.nameKey: (_) => const HomeAdmin(),
          ForgetPasswod.nameKey: (_) => const ForgetPasswod(),
          AddCatgries.nameKey: (_) => const AddCatgries(),
          ShowCatgroies.nameKey: (_) => const ShowCatgroies(),
          EditProfailAdmin.nameKey: (_) => const EditProfailAdmin(),
          RemoveCatgroies.nameKey: (_) => const RemoveCatgroies(),
          ShowAllUser.nameKey: (_) => const ShowAllUser(),
        },
      ),
    );
  }
}
