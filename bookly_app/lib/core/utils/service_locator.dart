import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  getIt.registerSingleton<HemoRepoImpl>(
    HemoRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
   getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}
