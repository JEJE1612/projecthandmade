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
