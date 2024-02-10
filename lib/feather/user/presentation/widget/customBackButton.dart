
import 'package:flutter/material.dart';

CustomBackButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(
      Icons.arrow_back,
      size: 15,
    ),
  );
}
