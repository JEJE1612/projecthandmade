import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/padding.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/mangment/chat_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/mangment/chat_state.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/widgets/chat_items.dart';

import 'package:handmade/feather/pages/Admin/presention/widgets/show_catg/widgets/custom_bar.dart';

class ChatPage extends StatelessWidget {
  static const String nameKey = "ChatPage";

  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc()..getAllUser(),
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CustomAppBar(
                      text: "Chat",
                    ),
                    const Gap(10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: leftMainPadding,
                          right: rightMainPadding,
                        ),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ChatItems(
                            model: ChatBloc.get(context).user[index],
                          ),
                          separatorBuilder: (context, index) => const Divider(
                              height: 20, thickness: 0.5, color: Colors.grey),
                          itemCount: ChatBloc.get(context).user.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
