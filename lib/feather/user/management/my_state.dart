abstract class MyState {}

class InitalState extends MyState {}

class ChangeBottonSheet extends MyState {}

class ChangeTheamMode extends MyState {}

class ScafullsignOut extends MyState {}

class LodingGetUserData extends MyState {}

class ScafullGetUserData extends MyState {}

class ErrorGetUserData extends MyState {
  final String error;
  ErrorGetUserData(this.error);
}

class HomeErrorStata extends MyState {
  final String error;
  HomeErrorStata(this.error);
}

class LodingGetProfailImage extends MyState {}

class ScafullGetProfailImage extends MyState {}

class ErrorGetProfailImage extends MyState {}

class ScafullGetCoverImage extends MyState {}

class ErrorGetCoverImage extends MyState {}

class LodingudateUserData extends MyState {}

class ScafulludateUserData extends MyState {}

class ErrorudateUserData extends MyState {}

class ScafullUploadcoverAdminState extends MyState {}

class ScafullUploadImageProfailState extends MyState {}

class ErrorUploadImageProfailState extends MyState {}

class ErorUploadcoverAdminState extends MyState {}

class LodingCreatAskUser extends MyState {}

class ScafullCreatAskUser extends MyState {}

class ErrorCreatAskUser extends MyState {}

class RemoveAskImage extends MyState {}

class LodingGetimageAsk extends MyState {}

class ScafullGetimageAsk extends MyState {}

class ErrorGetimageAsk extends MyState {}

class LodingUploadAskImageState extends MyState {}

class ScafullUploadAskImageState extends MyState {}

class ErorUploadAskImageState extends MyState {}

class LodingGetListAsk extends MyState {}

class ScafullGetListAsk extends MyState {}

class LodingDeleteAskUser extends MyState {}

class SuccessDeleteAskUser extends MyState {}

class ErrorDeleteAskUser extends MyState {}

class Removeimagework extends MyState {}

class LodingGetimagework extends MyState {}

class ScafullGetimagework extends MyState {}

class ScafullUploadcreatSameWorkState extends MyState {}

class ErrorUploadcreatSameWorkProfailState extends MyState {}

class ErorUploadcreatSameWorkState extends MyState {}

class LodingCreatSomeWork extends MyState {}

class ScafullCreatSomeWork extends MyState {}

class ErrorCreatSomeWork extends MyState {}

class LodingGetListSomeWork extends MyState {}

class ScafullGetSomeWork extends MyState {}

class LodingDeletesomeWorkid extends MyState {}

class SuccessDeletesomeWorkid extends MyState {}

class ErrorDeletesomeWorkid extends MyState {}

class LodingGetListAllAsk extends MyState {}

class ScafullGetListAllAsk extends MyState {}

class LodingGetUserDataChat extends MyState {}

class ScafullGetUserDataChat extends MyState {}

class EroorGetUserDataChat extends MyState {
  final String error;
  EroorGetUserDataChat(this.error);
}

class ScafullSendMessageState extends MyState {}

class ErrorSendMessageState extends MyState {}

class GetMessageScafull extends MyState {}

class LodinggetChatimageState extends MyState {}

class ScafulltChatimageState extends MyState {}

class ErrorChatimageState extends MyState {}

class LodingUploadChatImageState extends MyState {}

class ScafullUploadChatImageState extends MyState {}

class ErorrUploadChatImageState extends MyState {}

class LodingGetcatroiesState extends MyState {}

class ScafullGetcatroiesstate extends MyState {}

class ErrorGetcatroiesstate extends MyState {
  final String eror;
  ErrorGetcatroiesstate(this.eror);
}

class LodingGetAllConsltant extends MyState {}

class ScafullGetAllConsltant extends MyState {}

class ErrorGetGetAllConsltant extends MyState {
  final String eror;
  ErrorGetGetAllConsltant(this.eror);
}

class LodingGettypeconsultant extends MyState {}

class ScafullGettypeconslutant extends MyState {}

class ErrorGettypeconslutant extends MyState {
  final String eror;
  ErrorGettypeconslutant(this.eror);
}

class LodingGetPrivateworkConsultant extends MyState {}

class ScafullGetPrivateworkConsultant extends MyState {}

class ErrorGetPrivateworkConsultant extends MyState {}
