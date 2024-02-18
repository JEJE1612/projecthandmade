import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/model/comment_model.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_bloc.dart';

class CardItemsComment extends StatelessWidget {
  const CardItemsComment({
    super.key,
    required this.comment,
    required this.prodectuid,
  });
  final CommentModel comment;
  final String prodectuid;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          comment.imageuser ?? "",
                        ),
                        radius: 25),
                    const Gap(10),
                    Column(
                      children: [
                        Text(
                          comment.nameuser ?? "",
                          style: Styles.textStyle16,
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      comment.message ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (comment.userid == FirebaseAuth.instance.currentUser?.uid)
          Positioned(
            right: 10,
            child: PopupMenuButton<String>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'remove',
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 5),
                      Text('Remove'),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                // Handle selection here
                if (value == 'remove') {
                  CommentBloc.get(context).removeComment(
                      prodectuid: prodectuid,
                      commentUid: comment.commentid ?? "");
                }
              },
            ),
          ),
      ],
    );
  }
}
