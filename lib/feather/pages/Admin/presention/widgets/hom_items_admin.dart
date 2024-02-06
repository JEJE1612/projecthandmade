import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';

class HomeItemsAdmin extends StatelessWidget {
  const HomeItemsAdmin({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1;
  final String text2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: light,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(mainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text1,
                style: const TextStyle(
                    color: textBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              Center(
                child: Text(
                  text2,
                  style: const TextStyle(
                      color: primary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
