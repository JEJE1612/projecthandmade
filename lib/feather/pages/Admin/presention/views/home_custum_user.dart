import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/home_slider.dart';
import 'package:handmade/feather/user/views/home_user.dart';

class HomeCustomUser extends StatelessWidget {
  const HomeCustomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const CustomAppBarUser(),
        const Gap(10),
        const CustomSearch(),
        const Gap(10),
        HomeSlider(),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}
