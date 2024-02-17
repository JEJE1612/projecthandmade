import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/model/comment_model.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/views/comment_view.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/back_ground_prodect.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/information_prdect.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/udate_prodect.dart';

import '../../../mangment/prodect/prodect_state.dart';

class ProdectDeatils extends StatelessWidget {
  const ProdectDeatils({super.key, required this.prodect});
  final ProdectModel? prodect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: BlocListener<ProdectBloc, ProdectState>(
        listener: (context, state) {
          if (state is SuccessDeleteProect) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackGroundBrodect(
                  image: prodect?.prodectImage ?? "",
                ),
                InformationProdect(
                  model: prodect,
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "comment:",
                        style: Styles.textStyle20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "All_Comment",
                          style: Styles.textStyle16.copyWith(color: primary),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.17,
                //   child: Column(
                //     children: [
                //       Expanded(
                //         child: ListView.separated(
                //           padding: EdgeInsets.zero,
                //           separatorBuilder: (context, index) => const SizedBox(
                //             height: 5,
                //           ),
                //           itemCount: 10,
                //           itemBuilder: (context, index) => CardItemsComment(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const Gap(30),
                CustomButtonOwner(
                  title: "Comment",
                  color: primary,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentView(
                            model: prodect!,
                          ),
                        ));
                  },
                ),
                if (UserBloc.get(context).usermodel?.type != 'Owner')
                  CustomButtonOwner(
                    title: "Buy_it",
                    color: secondary,
                    onPressed: () {},
                  ),
                if (UserBloc.get(context).usermodel?.type == 'Owner')
                  CustomButtonOwner(
                    title: "Remove_it",
                    color: danger,
                    onPressed: () {
                      ProdectBloc.get(context)
                          .deleteProdect(prodect!.prodectuid!);
                    },
                  ),
                if (UserBloc.get(context).usermodel?.type == 'Owner')
                  CustomButtonOwner(
                    title: "update_it",
                    color: textBlack,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UdateProdectPage(
                              model: prodect!,
                            ),
                          ));
                    },
                  ),
                const Gap(10),
                const Divider(
                  indent: 80,
                  color: primary,
                  endIndent: 80,
                  height: 2,
                  thickness: 2,
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class CustomButtonOwner extends StatelessWidget {
  const CustomButtonOwner({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
  });
  final Function()? onPressed;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: textWhite,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
