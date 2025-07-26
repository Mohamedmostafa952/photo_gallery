import 'package:photo_gallery/features/home/domain/entities/photo_entity.dart';

sealed class PhotosStates {}

class PhotosStatesInitial extends PhotosStates {}

class PhotosLoadingState extends PhotosStates {}

class PhotosSuccessState extends PhotosStates {
  final List<PhotoEntity> photos;

  PhotosSuccessState({required this.photos});
}

class PhotosErrorState extends PhotosStates {
  final String errorMessage;

  PhotosErrorState({required this.errorMessage});
}
