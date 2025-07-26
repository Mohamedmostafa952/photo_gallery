import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:photo_gallery/features/home/data/models/photos_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://api.pexels.com/v1")
abstract class PhotosApiService {
  factory PhotosApiService(Dio dio, {String baseUrl}) = _PhotosApiService;

  @GET("/curated")
  Future<PhotosResponse> getPhotos({
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 40,
  });
}

