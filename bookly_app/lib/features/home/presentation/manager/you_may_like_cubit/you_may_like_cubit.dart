// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';

part 'you_may_like_state.dart';

class YouMayLikeCubit extends Cubit<YouMayLikeState> {
  YouMayLikeCubit(
    this.homeRepo,
  ) : super(YouMayLikeInitial());

  final HomeRepo homeRepo;

  Future<void> fetchYouMayLikeBooks(String subject) async {
    emit(YouMayLikeLoading());
    var result = await homeRepo.fetchRelevanceBooks(subject: subject);
    result.fold((failure) => {
      emit(YouMayLikeFailure(errorMsg: failure.errorMsg)),
    }, (books) => {
      emit(YouMayLikeSuccess(books: books)),
    });
  }
}
