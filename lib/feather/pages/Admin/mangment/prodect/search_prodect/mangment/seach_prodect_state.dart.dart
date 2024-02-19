abstract class SearchProdetState {}

class LoadingState extends SearchProdetState {}

class LoadedState extends SearchProdetState {
  final List resultlist;

  LoadedState(this.resultlist);
}
