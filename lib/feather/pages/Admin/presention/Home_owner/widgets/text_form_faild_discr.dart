import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';

class TxetFormDiscription extends StatelessWidget {
  const TxetFormDiscription({
    super.key,
    required this.discr,
  });
  final TextEditingController discr;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style:
              TextStyle(fontSize: 16, color: grey, fontWeight: FontWeight.w500),
        ),
        const Gap(10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: textFieldBg, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              maxLines: 3,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field cant Empty";
                }
                return '';
              },
              controller: discr,
              cursorColor: textBlack,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Enter Descriotion"),
            ),
          ),
        ),
      ],
    );
  }
}
