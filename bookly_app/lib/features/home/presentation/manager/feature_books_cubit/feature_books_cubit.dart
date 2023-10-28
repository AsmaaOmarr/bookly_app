// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo
  ) : super(FeatureBooksInitial());

  final HomeRepo homeRepo ;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatureBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) => {
      emit(FeatureBooksFailure(errorMsg: failure.errorMsg)),
    }, (books) => {
      emit(FeatureBooksSuccess(books: books))
    });
  }
}
