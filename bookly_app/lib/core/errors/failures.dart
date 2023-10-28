import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  const Failure({required this.errorMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMsg});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMsg: "connection timeout with api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMsg: "Sending timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMsg: "Receive timeout");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!,dioException.response!.data!);
      case DioExceptionType.cancel:
        return ServerFailure(errorMsg: "Request canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMsg: "Connection Error");
      case DioExceptionType.unknown:
        return ServerFailure(errorMsg: "UnExpected Error try again");
      default:
        return ServerFailure(errorMsg: "UnExpected Error try again");
    }
  }

  factory ServerFailure.fromResponse(int statesCode, dynamic response) {
    if (statesCode == 400 || statesCode == 401 || statesCode == 403) {
      return ServerFailure(errorMsg: response['error']['message']);
    }else if (statesCode == 404 ) {
      return ServerFailure(errorMsg: 'Not Found, try again later');
    } else if (statesCode == 500) {
      return ServerFailure(errorMsg: 'Server error, try again later');
    }else{
       return ServerFailure(errorMsg: 'Oops there was an error, try again');
    }
  }
}
