import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/main-appbar.dart';

class HomeAdmin extends StatelessWidget {
  static const String nameKey = "HomeAdmin";

  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textFieldBg,
      appBar: PreferredSize(
        child: MainAppBar(size: size),
        preferredSize: const Size.fromHeight(80),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
