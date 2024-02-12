import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';

class CustomTextFormFaild extends StatelessWidget {
  const CustomTextFormFaild({
    super.key,
    required this.controll,
    required this.head,
    required this.hintText,
    required this.keyboardType,
  });

  final TextEditingController controll;
  final String head;
  final String hintText;
  final TextInputType keyboardType;

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
          decoration: BoxDecoration(
              color: textFieldBg, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: keyboardType,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field cant Empty";
                      }
                      return '';
                    },
                    controller: controll,
                    cursorColor: textBlack,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: hintText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
