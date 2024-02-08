abstract class LoginState {}

class InitalState extends LoginState {}

class ChangeIconSuffix extends LoginState {}

class LodingLoginState extends LoginState {}

class LoginSucssesState extends LoginState {
  final String uid;
  LoginSucssesState({
    required this.uid,
  });
}

class LoginFailureState extends LoginState {}

class Forgetpasswordstate extends LoginState {}

class LoginAsClint extends LoginState {}

class LoginAsConsltent extends LoginState {}

class LoginAsadmin extends LoginState {}
