import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/data/chat_model.dart';

Widget buildMyMessage(ChatModel? massge) => Align(
      alignment: AlignmentDirectional.topEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
                topStart: Radius.circular(10),
              ),
            ),
            child: Text(
              "${massge?.text}",
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          if (massge?.chatImage != "")
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, // Adjust the BoxFit as needed
                    image: NetworkImage(
                      "${massge?.chatImage}",
                    ) // Use the message's image URL
                    ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadiusDirectional.only(
          //       bottomEnd: Radius.circular(10),
          //       topEnd: Radius.circular(10),
          //       bottomStart: Radius.circular(10),
          //     ),
          //   ),
          //   child: Text(
          //     "${massge?.dateTime}",
          //     style: const TextStyle(color: Colors.grey, fontSize: 16),
          //   ),
          // ),
        ],
      ),
    );

class BuildMyMessage extends StatelessWidget {
  const BuildMyMessage({super.key, required this.massge});
  final ChatModel massge;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10),
                  bottomStart: Radius.circular(10),
                  topStart: Radius.circular(10),
                ),
              ),
              child: Text(
                "${massge.text}",
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            if (massge.chatImage != "")
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, // Adjust the BoxFit as needed
                      image: NetworkImage(
                        "${massge.chatImage}",
                      ) // Use the message's image URL
                      ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadiusDirectional.only(
            //       bottomEnd: Radius.circular(10),
            //       topEnd: Radius.circular(10),
            //       bottomStart: Radius.circular(10),
            //     ),
            //   ),
            //   child: Text(
            //     "${massge?.dateTime}",
            //     style: const TextStyle(color: Colors.grey, fontSize: 16),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
