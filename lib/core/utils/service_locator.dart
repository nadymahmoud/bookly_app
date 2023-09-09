import 'package:bookly_app/Features/Splash/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIT = GetIt.instance;
void setupServiceLocator() {
  getIT.registerSingleton<ApiService>(ApiService(Dio()));
  getIT.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIT.get<ApiService>(),
    ),
  );
}
