import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/cors/theme/padding.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.8,
        backgroundColor: textWhite,
        automaticallyImplyLeading: false,
        primary: false,
        excludeHeaderSemantics: true,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
                left: leftMainPadding, right: rightMainPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Delivery Details",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        getSvgIcon(AssetsData.arrowright),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
