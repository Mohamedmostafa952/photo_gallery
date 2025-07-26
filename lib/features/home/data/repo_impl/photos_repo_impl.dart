import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/error/app_exception.dart';
import 'package:photo_gallery/core/error/failure.dart';
import 'package:photo_gallery/features/home/data/data_source/photos_remote_data_source.dart';
import 'package:photo_gallery/features/home/data/models/photos_response.dart';
import 'package:photo_gallery/features/home/domain/entities/photo_entity.dart';
import 'package:photo_gallery/features/home/domain/repo/photos_repo.dart';

@Injectable(as: PhotosRepo)
class PhotosRepoImpl implements PhotosRepo {
  final PhotosRemoteDataSource dataSource;

  @factoryMethod
  PhotosRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<PhotoEntity>>> getPhotos(int page) async {
    try {
      var result = await dataSource.getPhotos(page);

      final box = Hive.box<PhotosResponse>('photosBox');
      await box.put('cachedPhotos', result);

      print("Photos cached successfully in Hive");

      return Right(
        result.photos
            .map(
              (photo) => PhotoEntity(
                height: photo.height,
                width: photo.width,
                originalSrc: photo.src.original,
              ),
            )
            .toList(),
      );
    } on AppException catch (exception) {
      final box = Hive.box<PhotosResponse>('photosBox');
      final cached = box.get('cachedPhotos');

      if (cached != null) {
        return Right(
          cached.photos
              .map(
                (photo) => PhotoEntity(
                  height: photo.height,
                  width: photo.width,
                  originalSrc: photo.src.original,
                ),
              )
              .toList(),
        );
      } else {
        return Left(Failure(errorMessage: "No cached data available."));
      }
    }
  }
}
