import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';

class OwnerAvatar extends StatelessWidget {
  const OwnerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(50)),
      child: const Text(
        "C",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: primary,
        ),
      ),
    );
  }
}
