abstract class SearchProdetEvent {}

class InitializeEvent extends SearchProdetEvent {}

class SearchEvent extends SearchProdetEvent {
  final String searchQuery;

  SearchEvent(this.searchQuery);
}
