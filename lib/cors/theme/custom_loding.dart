import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';

class CustomLoding extends StatelessWidget {
  const CustomLoding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: primary,
          ),
        ),
      ),
    );
  }
}
