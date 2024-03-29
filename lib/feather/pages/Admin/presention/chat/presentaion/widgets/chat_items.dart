import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/widgets/chat_deatils.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';

class ChatItems extends StatelessWidget {
  const ChatItems({super.key, required this.model});
  final UserModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => chatDeatiles(model),
                ));
          },
          child: Card(
            color: textWhite,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: leftMainPadding,
                  right: rightMainPadding),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      model.image ?? "",
                      //    errorListener: (p0) => Image.asset(AssetsData.user),
                    ),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    model.name ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
