import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/error/app_exception.dart';
import 'package:photo_gallery/features/home/data/data_source/photos_remote_data_source.dart';
import 'package:photo_gallery/features/home/data/models/photos_response.dart';

import '../api_services/api_services.dart';

@Injectable(as: PhotosRemoteDataSource)
class PhotosApiRemoteDataSource implements PhotosRemoteDataSource {
  final PhotosApiService apiService;

  PhotosApiRemoteDataSource(this.apiService);

  @override
  Future<PhotosResponse> getPhotos(int page) async {
    try {
      return await apiService.getPhotos(page: page,perPage: 40);
    } catch (e) {
      throw RemoteException(message: "Failed to load photos: $e");
    }
  }
}
