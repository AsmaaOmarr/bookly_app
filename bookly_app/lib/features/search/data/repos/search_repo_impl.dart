import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class SearchRepoImpl implements SearchRepo{

  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(String searchSubject) async {
    
    try {
      var data = await apiServices.get(
          endpoint:
              'volumes?Filtering=free-ebooks&q=intitle:$searchSubject');

      List<BookModel> booksList = [];
      for (var item in data['items']) {
        try {
          BookModel bookModel = BookModel.fromJson(item);
          booksList.add(bookModel);
        } catch (e) {
          // TODO
        }
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }

}