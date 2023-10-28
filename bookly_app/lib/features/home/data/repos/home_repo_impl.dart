import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HemoRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HemoRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:science fiction');

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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:General');

      List<BookModel> booksList = [];
      for (var item in data['items']) {
        BookModel bookModel = BookModel.fromJson(item);
        booksList.add(bookModel);
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchRelevanceBooks({required String subject}) async{
    try {
      var data = await apiServices.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$subject');

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
