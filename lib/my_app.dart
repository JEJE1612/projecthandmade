import 'package:flutter/material.dart';
import 'package:handmade/feather/pages/Admin/presention/views/home_admin.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/forgetpassword.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/login_page.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/register_pagee.dart';
import 'package:handmade/feather/pages/onbording_page/onbording.dart';
import 'package:handmade/feather/pages/splach_screen/presentaion/views/splach.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HandMade',
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      initialRoute: SplashView.nameKey,
      routes: {
        SplashView.nameKey: (_) => const SplashView(),
        Onborording.nameKey: (_) => const Onborording(),
        LoginPage.nameKey: (_) => const LoginPage(),
        Registerpage.nameKey: (_) => const Registerpage(),
        HomeAdmin.nameKey: (_) => const HomeAdmin(),
        ForgetPasswod.nameKey: (_) => const ForgetPasswod(),
      },
    );
  }
}
