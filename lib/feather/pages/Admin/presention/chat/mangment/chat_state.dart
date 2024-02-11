abstract class ChatState {}

class InitalState extends ChatState {}

class LodingGetUserDataChat extends ChatState {}

class ScafullGetUserDataChat extends ChatState {}

class EroorGetUserDataChat extends ChatState {
  final String eror;

  EroorGetUserDataChat(this.eror);
}

class ScafullSendMessageState extends ChatState {}

class ErrorSendMessageState extends ChatState {}

class LodinggetChatimageState extends ChatState {}

class ScafulltChatimageState extends ChatState {}

class ErrorChatimageState extends ChatState {}

class LodingUploadChatImageState extends ChatState {}

class ScafullUploadChatImageState extends ChatState {}

class ErorrUploadChatImageState extends ChatState {}

class GetMessageScafull extends ChatState {}

class LoadedState extends ChatState {
  final List resultlist;

  LoadedState(this.resultlist);
}
