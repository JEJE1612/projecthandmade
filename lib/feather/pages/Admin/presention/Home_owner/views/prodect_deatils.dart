import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_state.dart';
import 'package:handmade/feather/pages/Admin/mangment/prodect/prodect_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/user/user_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/views/comment_view.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/back_ground_prodect.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/card_items_comment.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/custom_button_owner.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/information_prdect.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/udate_prodect.dart';

import '../../../mangment/prodect/prodect_state.dart';

class ProdectDeatils extends StatelessWidget {
  const ProdectDeatils({super.key, required this.prodect});
  final ProdectModel? prodect;

  @override
  Widget build(BuildContext context) {
    CommentBloc commentBloc = BlocProvider.of<CommentBloc>(context)
      ..getComment(prodectuid: prodect?.prodectuid ?? "");

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
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommentView(
                                  model: prodect!,
                                ),
                              ));
                        },
                        child: Text(
                          "Show_All_Comment",
                          style: Styles.textStyle16.copyWith(color: primary),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: BlocBuilder<CommentBloc, CommentState>(
                    builder: (context, state) {
                      if (state is GetMessageScafull) {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: commentBloc.messages.length,
                          itemBuilder: (context, index) => CardItemsComment(
                            prodectuid: prodect?.prodectuid ?? "",
                            comment: commentBloc.messages[index],
                          ),
                        );
                      } else {
                        return Center(
                          child: Text("data"),
                        );
                      }
                    },
                  ),
                ),
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
