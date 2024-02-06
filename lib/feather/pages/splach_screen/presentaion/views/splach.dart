import 'package:flutter/material.dart';
import 'package:handmade/feather/pages/splach_screen/presentaion/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String nameKey = "SplashView";

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewbody(),
    );
  }
}
