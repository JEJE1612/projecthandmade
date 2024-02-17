abstract class CommentState {}

class IninalSate extends CommentState {}

class LodingCreatComment extends CommentState {}

class ScafullCreatComment extends CommentState {}

class ErrorCreatComment extends CommentState {
  final String error;
  ErrorCreatComment({required this.error});
}

class GetMessageScafull extends CommentState {}

class ScafullDealetComment extends CommentState {}
