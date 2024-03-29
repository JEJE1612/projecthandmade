import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/helper.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.8,
      backgroundColor: textWhite,
      title: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                color: textBlack, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          getSvgIcon(AssetsData.arrowright),
        ],
      ),
    );
  }
}
