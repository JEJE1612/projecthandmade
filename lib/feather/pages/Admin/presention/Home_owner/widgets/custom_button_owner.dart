import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';

class CustomButtonOwner extends StatelessWidget {
  const CustomButtonOwner({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
  });
  final Function()? onPressed;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: textWhite,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
