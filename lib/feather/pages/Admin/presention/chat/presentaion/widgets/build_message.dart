import 'package:flutter/material.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/data/chat_model.dart';

class Buildmesssage extends StatelessWidget {
  const Buildmesssage({super.key, required this.massge});
  final ChatModel massge;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                topEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
              ),
            ),
            child: Text(
              "${massge.text}",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     borderRadius: const BorderRadiusDirectional.only(
          //       bottomEnd: Radius.circular(10),
          //       topEnd: Radius.circular(10),
          //       bottomStart: Radius.circular(10),
          //     ),
          //   ),
          //   child: Text(
          //     "${massge?.dateTime}",
          //     style: TextStyle(color: Colors.grey, fontSize: 16),
          //   ),
          // ),
        ],
      ),
    );
  }
}
