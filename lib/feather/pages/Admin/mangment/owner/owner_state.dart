abstract class ShowAllownerState {}

class LoadingState extends ShowAllownerState {}

class LoadedState extends ShowAllownerState {
  final List resultlist;

  LoadedState(this.resultlist);
}

class ChangeBottonSheet extends ShowAllownerState {}
