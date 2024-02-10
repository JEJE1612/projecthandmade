import 'package:flutter/material.dart';

AppBar customAppBar(String title, bool willPopWhenPressTheDefaultBackButton) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  );
}
