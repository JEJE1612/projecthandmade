abstract class ShowAllownerEvent {}

class InitializeEvent extends ShowAllownerEvent {}

class SearchEvent extends ShowAllownerEvent {
  final String searchQuery;

  SearchEvent(this.searchQuery);
}
