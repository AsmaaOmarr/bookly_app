import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  void fetchSearchBooks(String searchSubject) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(searchSubject);
    result.fold((failure) => {
      emit(SearchFailure(errorMsg: failure.errorMsg))
    }, (books) => {
      emit(SearchSuccess(books: books))
    });
  }
}
