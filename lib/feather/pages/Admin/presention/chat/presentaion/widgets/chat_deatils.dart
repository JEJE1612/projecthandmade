import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/mangment/chat_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/mangment/chat_state.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/widgets/build_message.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/presentaion/widgets/build_my_message.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';

chatDeatiles(UserModel? user) {
  var massageController = TextEditingController();

  return BlocProvider(
    create: (context) => ChatBloc()
      ..getmessages(
        resiverId: user!.uid!,
      ),
    child: BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is LodingUploadChatImageState) {
          const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "${user?.image}",
                  ),
                  radius: 20,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "${user?.name}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ChatBloc.get(context).getChatImage(
                    chatImage: '',
                    reseverId: user!.uid!,
                    dateTime: DateTime.now().toString(),
                    text: "",
                  );
                },
                icon: const Icon(Icons.camera_alt),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        if (user?.uid ==
                            ChatBloc.get(context).messages[index].senderId) {
                          return Buildmesssage(
                            massge: ChatBloc.get(context).messages[index],
                          );
                        }
                        return BuildMyMessage(
                          massge: ChatBloc.get(context).messages[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemCount: ChatBloc.get(context).messages.length),
                ),
                TextFormField(
                  controller: massageController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          ChatBloc.get(context).sendMessagechat(
                            text: massageController.text,
                            dateTime: DateTime.now().toString(),
                            reseverId: user!.uid!,
                          );
                          massageController.clear();
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
              ],
            ),
          ),
        );
      },
    ),
  );
}

OutlineInputBorder customStyleBorderchat() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.black));
}



//   final UserModel model;
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
