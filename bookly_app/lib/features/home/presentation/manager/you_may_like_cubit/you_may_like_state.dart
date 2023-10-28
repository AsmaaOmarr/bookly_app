part of 'you_may_like_cubit.dart';

sealed class YouMayLikeState extends Equatable {
  const YouMayLikeState();

  @override
  List<Object> get props => [];
}

final class YouMayLikeInitial extends YouMayLikeState {}

final class YouMayLikeLoading extends YouMayLikeState {}

final class YouMayLikeSuccess extends YouMayLikeState {
  final List<BookModel> books;

  const YouMayLikeSuccess({required this.books});
}

final class YouMayLikeFailure extends YouMayLikeState {
  final String errorMsg;

  const YouMayLikeFailure({required this.errorMsg});
}
