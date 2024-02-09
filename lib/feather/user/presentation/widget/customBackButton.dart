// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomBackButton() {
  return IconButton(
    onPressed: () {
      Get.back();
    },
    icon: const Icon(
    Icons.arrow_back,
      size: 15,
      //color: Get.isDarkMode ? whiteColor : darkBlueColor,
    ),
  );
}
