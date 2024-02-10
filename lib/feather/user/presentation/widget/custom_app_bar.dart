import 'package:flutter/material.dart';

AppBar customAppBar(String title, bool willPopWhenPressTheDefaultBackButton,BuildContext context) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  );
}
