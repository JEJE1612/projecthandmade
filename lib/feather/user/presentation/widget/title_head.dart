import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';

class TitleHeaderAndSeeAllButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleHeaderAndSeeAllButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.textStyle18,
          ),
          TextButton(
            onPressed: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primary,
              ),
              child: Text(
                "See All",
                style: Styles.textStyle16.copyWith(color: textFieldBg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
