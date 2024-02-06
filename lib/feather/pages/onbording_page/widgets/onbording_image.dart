import 'package:flutter/material.dart';

Center onbordingImage(BuildContext context, Widget? child) {
  return Center(
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 100,
        bottom: 2,
      ),
      width: MediaQuery.of(context).size.width * 0.99,
      child: child,
    ),
  );
}
