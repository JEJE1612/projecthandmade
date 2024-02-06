import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';

class CustomTextFormFaild extends StatelessWidget {
  const CustomTextFormFaild({
    super.key,
    required this.controll,
    required this.head,
    required this.hintText,
  });

  final TextEditingController controll;
  final String head;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          style: const TextStyle(
              fontSize: 16, color: grey, fontWeight: FontWeight.w500),
        ),
        const Gap(10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: textFieldBg, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field cant Empty";
                }
                return '';
              },
              controller: controll,
              cursorColor: textBlack,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hintText),
            ),
          ),
        ),
      ],
    );
  }
}
