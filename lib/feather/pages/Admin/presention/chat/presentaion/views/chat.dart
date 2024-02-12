import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:handmade/cors/theme/colors.dart';

import 'package:handmade/feather/pages/Admin/presention/chat/mangment/chat_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/mangment/chat_state.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/widgets/chat_items.dart';

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
          var size = MediaQuery.of(context).size;
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: textWhite,
                    width: double.infinity,
                    height: size.height * 0.08,
                    child: const Center(
                      child: Text(
                        "Chat",
                        style: TextStyle(
                            fontSize: 18,
                            color: textBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: light,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => ChatItems(
                          model: ChatBloc.get(context).user[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemCount: ChatBloc.get(context).user.length,
                      ),
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
