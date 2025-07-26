import 'package:photo_gallery/features/home/data/models/photos_response.dart';

abstract class PhotosRemoteDataSource {
  Future<PhotosResponse> getPhotos(int page);
}
