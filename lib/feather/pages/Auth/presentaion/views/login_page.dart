import 'package:flutter/material.dart';
import 'package:handmade/feather/pages/Auth/presentaion/widgets/login-body.dart';

class LoginPage extends StatelessWidget {
  static const String nameKey = "LoginPage";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
