import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/cors/theme/style_text.dart';
import 'package:handmade/feather/pages/Admin/data/model/prodect_model.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_bloc.dart';
import 'package:handmade/feather/pages/Admin/mangment/comment/comment_state.dart';
import 'package:handmade/feather/pages/Admin/presention/Home_owner/widgets/card_items_comment.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/widgets/chat_deatils.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key, required this.model});
  final ProdectModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentBloc()..getComment(prodectuid: model.prodectuid ?? ""),
      child: BlocConsumer<CommentBloc, CommentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: light,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: textWhite,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: const Center(
                      child: Text(
                        "Comment",
                        style: TextStyle(
                            fontSize: 18,
                            color: textBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  if (CommentBloc.get(context).messages.isEmpty)
                    Expanded(
                        child: Center(
                      child: Text(
                        "No_Comment ",
                        style: Styles.textStyle20,
                      ),
                    )),
                  if (CommentBloc.get(context).messages.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: CommentBloc.get(context).messages.length,
                        itemBuilder: (context, index) => CardItemsComment(
                          prodectuid: model.prodectuid ?? "",
                          comment: CommentBloc.get(context).messages[index],
                        ),
                      ),
                    ),
                  Container(
                    color: light,
                    padding: const EdgeInsets.only(
                        bottom: 5,
                        left: leftMainPadding,
                        right: rightMainPadding),
                    child: TextFormField(
                      controller: CommentBloc.get(context).message,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              CommentBloc.get(context).creatCommen(
                                context: context,
                                prodectuid: model.prodectuid ?? "",
                              );
                              CommentBloc.get(context).message.clear();
                            },
                            icon: const Icon(
                              Icons.send,
                            ),
                          ),
                          hintText: "message",
                          focusedBorder: customStyleBorderchat(),
                          disabledBorder: customStyleBorderchat(),
                          border: customStyleBorderchat(),
                          enabledBorder: customStyleBorderchat()),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
