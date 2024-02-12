import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';
import 'package:handmade/cors/theme/padding.dart';

class AppBarOwner extends StatelessWidget {
  const AppBarOwner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: textWhite,
      padding:
          const EdgeInsets.only(left: leftMainPadding, right: rightMainPadding),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Hand made",
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
              const Gap(5),
              const Text(
                "Weclom Owner",
                style: TextStyle(
                  color: primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
