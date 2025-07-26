import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/resources/constants_manager.dart';
import 'package:photo_gallery/features/home/data/api_services/api_services.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: {'Authorization': ApiConstants.apiKey},
  ));

  @lazySingleton
  PhotosApiService apiService(Dio dio) => PhotosApiService(dio);
}
