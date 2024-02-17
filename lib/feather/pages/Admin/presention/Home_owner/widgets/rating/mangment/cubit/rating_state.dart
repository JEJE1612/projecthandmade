part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingSucess extends RatingState {
  final List<RatingModel> allRating;

  RatingSucess({required this.allRating});
}

final class AddSucess extends RatingState {}

final class RatingFailure extends RatingState {
  final String errorMessage;

  RatingFailure({required this.errorMessage});
}

final class RatingconLoading extends RatingState {}

final class RatingconSucess extends RatingState {
  final List<RatingModel> allRating;

  RatingconSucess({required this.allRating});
}

final class RatingconFailure extends RatingState {
  final String errorMessage;

  RatingconFailure({required this.errorMessage});
}
