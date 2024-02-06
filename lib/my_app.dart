import 'package:flutter/material.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/login_page.dart';
import 'package:handmade/feather/pages/onbording_page/onbording.dart';
import 'package:handmade/feather/pages/splach_screen/presentaion/views/splach.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consult_me',
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      initialRoute: SplashView.nameKey,
      routes: {
        SplashView.nameKey: (_) => const SplashView(),
        Onborording.nameKey: (_) => const Onborording(),
        LoginPage.nameKey: (_) => const LoginPage(),
      },
    );
  }
}
