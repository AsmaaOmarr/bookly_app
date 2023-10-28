// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiServices {
  final baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio ;
  ApiServices({
    required this.dio,
  });

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await dio.get('$baseUrl$endpoint');

    return response.data;
  }
}
