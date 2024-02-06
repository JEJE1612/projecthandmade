import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';

class OnBordingitems extends StatelessWidget {
  const OnBordingitems({
    super.key,
    required this.title1,
    required this.title2,
  });
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 480,
          ),
          Text(
            title1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: primary,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: grey,
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
