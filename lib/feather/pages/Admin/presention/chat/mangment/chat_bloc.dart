import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/data/chat_model.dart';
import 'package:handmade/feather/pages/Admin/presention/chat/mangment/chat_state.dart';
import 'package:handmade/feather/pages/Auth/data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ChatBloc extends Cubit<ChatState> {
  ChatBloc() : super(InitalState());
  static ChatBloc get(context) => BlocProvider.of(context);
  ImagePicker picker = ImagePicker();

  var uid = FirebaseAuth.instance.currentUser?.uid;
  List<UserModel> user = [];
  Future<void> getAllUser() async {
    emit(LodingGetUserDataChat());
    if (user.isEmpty) {
      await FirebaseFirestore.instance.collection("user").get().then((value) {
        for (var element in value.docs) {
          if (element.data()["uid"] != uid) {
            user.add(UserModel.fromJson(element.data()));
            emit(ScafullGetUserDataChat());
          }
        }
      }).catchError((e) {
        emit(EroorGetUserDataChat(e.toString()));
      });
    }
  }

  void sendMessagechat({
    required String reseverId,
    required String dateTime,
    required String text,
    String? chatImge,
  }) {
    ChatModel model = ChatModel(
        senderId: uid,
        reseverId: reseverId,
        chatImage: chatImge ?? "",
        dateTime: dateTime,
        text: text);
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("chats")
        .doc(reseverId)
        .collection("Message")
        .add(model.toMap())
        .then((value) {
      emit(ScafullSendMessageState());
    }).catchError((e) {
      emit(ErrorSendMessageState());
    });
    FirebaseFirestore.instance
        .collection("user")
        .doc(reseverId)
        .collection("chats")
        .doc(uid)
        .collection("Message")
        .add(model.toMap())
        .then((value) {
      emit(ScafullSendMessageState());
      print(uid);
    }).catchError((e) {
      emit(ErrorSendMessageState());
    });
  }

  List<ChatModel> messages = [];

  void getmessages({required String resiverId}) {
    messages.clear();
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("chats")
        .doc(resiverId)
        .collection("Message")
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages.clear();
      event.docs.forEach((element) {
        messages.add(ChatModel.fromJson(element.data()));
      });
      emit(GetMessageScafull());
    });
  }

  File? chatimage;

  Future<void> getChatImage({
    required String text,
    required String dateTime,
    required String chatImage,
    required String reseverId,
  }) async {
    emit(LodinggetChatimageState());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      chatimage = File(pickedFile.path);

      emit(ScafulltChatimageState());
      uploadpChatImageImage(
          text: text,
          dateTime: dateTime,
          chatImage: chatImage,
          reseverId: reseverId);
    } else {
      print('No image selected.');
      emit(ErrorChatimageState());
    }
  }

  void uploadpChatImageImage({
    required String text,
    required String dateTime,
    required String chatImage,
    required String reseverId,
  }) {
    emit(LodingUploadChatImageState());
    FirebaseStorage.instance
        .ref()
        .child("user/chat/${Uri.file(chatimage!.path).pathSegments.last}")
        .putFile(chatimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        sendMessagechat(
          dateTime: dateTime,
          reseverId: reseverId,
          text: text,
          chatImge: value,
        );
        emit(ScafullUploadChatImageState());
      }).catchError((e) {
        emit(ErorrUploadChatImageState());
      });
    }).catchError((e) {
      emit(ErorrUploadChatImageState());
    });
  }

  final TextEditingController searchword = TextEditingController();
    List allResult = [];
  List resultlist = [];
  void initialize() async {
    var data = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('name')
        .get();
    allResult = data.docs;
    searchResultList();
    emit(LoadedState(resultlist));
  }

  void searchResultList() {
    var showResult = [];
    if (searchword.text != '') {
      for (var userSnapshot in allResult) {
        var name = userSnapshot['name'].toString().toLowerCase();
        if (name.contains(searchword.text.toLowerCase())) {
          showResult.add(userSnapshot);
        }
      }
    } else {
      showResult = List.from(allResult);
    }
    resultlist = showResult;
    emit(LoadedState(resultlist));
  }
}
