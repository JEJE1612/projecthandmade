import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/user/presentation/home_screen_widgets/home_slider.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const CustomAppBarUser(),
            const Gap(10),
            const CustomSearch(),
            const Gap(10),
            HomeSlider(),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categoris",
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w800),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Show All",
                      style: Styles.textStyle16.copyWith(color: grey),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: textFieldBg,
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          getSvgIcon(AssetsData.searchicon),
          const Gap(20),
          Text(
            "Search",
            style: Styles.textStyle18.copyWith(color: grey),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarUser extends StatelessWidget {
  const CustomAppBarUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          color: light,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hand_Made", style: Styles.textStyle20),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Weclom User",
            style: Styles.textStyle16.copyWith(color: primary),
          ),
        ),
      ],
    );
  }
}
