abstract class DealtAllUserState {}

class LoadingState extends DealtAllUserState {}

class LoadedState extends DealtAllUserState {
  final List resultlist;

  LoadedState(this.resultlist);
}
