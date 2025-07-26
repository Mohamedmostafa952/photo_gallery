import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/error/failure.dart';
import 'package:photo_gallery/features/home/domain/entities/photo_entity.dart';
import 'package:photo_gallery/features/home/domain/repo/photos_repo.dart';

@injectable
class GetPhotosUseCase{
  PhotosRepo repo;
  @factoryMethod
  GetPhotosUseCase({required this.repo});

  Future<Either<Failure, List<PhotoEntity>>> invoke(int page){
    return repo.getPhotos(page);
  }
}