abstract class DealtAllUserEvent {}

class InitializeEvent extends DealtAllUserEvent {}

class SearchEvent extends DealtAllUserEvent {
  final String searchQuery;

  SearchEvent(this.searchQuery);
}
