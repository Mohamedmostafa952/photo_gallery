import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/error/failure.dart';
import 'package:photo_gallery/features/home/domain/entities/photo_entity.dart';

abstract class PhotosRepo{
  Future<Either<Failure, List<PhotoEntity>>> getPhotos(int page);
}