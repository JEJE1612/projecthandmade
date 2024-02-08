abstract class UserState {}

class InitalState extends UserState {}

class LodingGetUserData extends UserState {}

class ScafullGetUserData extends UserState {}

class HomeErrorStata extends UserState {
  final String error;
  HomeErrorStata(this.error);
}

class ErrorGetUserData extends UserState {
  final String error;
  ErrorGetUserData(this.error);
}

class LodingGetProfailImage extends UserState {}

class ScafullGetProfailImage extends UserState {}

class ErrorGetProfailImage extends UserState {}

class LodingUdateAdminData extends UserState {}

class ScafullUdateAdminData extends UserState {}

class ErrorUdateAdminData extends UserState {}

class LodingUploadImageProfailState extends UserState {}

class ScafullUploadImageProfailState extends UserState {}

class ErrorUploadImageProfailState extends UserState {}
