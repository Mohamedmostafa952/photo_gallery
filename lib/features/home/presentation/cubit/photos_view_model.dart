import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/features/home/domain/entities/photo_entity.dart';
import 'package:photo_gallery/features/home/domain/usecases/get_photos_use_case.dart';
import 'package:photo_gallery/features/home/presentation/cubit/photos_states.dart';

@injectable
class PhotosViewModel extends Cubit<PhotosStates> {
  @factoryMethod
  PhotosViewModel({required this.useCase}) : super(PhotosStatesInitial());

  final GetPhotosUseCase useCase;

  int currentPage = 1;
  bool isLoadingMore = false;
  bool allPagesLoaded = false;
  final List<PhotoEntity> _allPhotos = [];

  void loadPhotos() async {
    emit(PhotosLoadingState());
    currentPage = 1;
    allPagesLoaded = false;
    _allPhotos.clear();
    allPagesLoaded = false;
    _allPhotos.clear();
    var result = await useCase.invoke(currentPage);
    result.fold(
      (failure) {
        emit(PhotosErrorState(errorMessage: failure.errorMessage));
      },
      (photos) {
        _allPhotos.addAll(photos);
        emit(PhotosSuccessState(photos: _allPhotos));
      },
    );
  }

  Future<void> loadMorePhotos() async {
    if (isLoadingMore || allPagesLoaded) return;

    isLoadingMore = true;
    final result = await useCase.invoke(currentPage + 1);

    result.fold((failure) {}, (photos) {
      if (photos.isEmpty) {
        allPagesLoaded = true;
      } else {
        currentPage++;
        _allPhotos.addAll(photos);
        emit(PhotosSuccessState(photos: _allPhotos));
      }
    });

    isLoadingMore = false;
  }
}
