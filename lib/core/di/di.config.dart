// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/api_services/api_services.dart' as _i304;
import '../../features/home/data/data_source/photos_api_remote_data_source.dart'
    as _i875;
import '../../features/home/data/data_source/photos_remote_data_source.dart'
    as _i509;
import '../../features/home/data/repo_impl/photos_repo_impl.dart' as _i621;
import '../../features/home/domain/repo/photos_repo.dart' as _i267;
import '../../features/home/domain/usecases/get_photos_use_case.dart' as _i440;
import '../../features/home/presentation/cubit/photos_view_model.dart' as _i101;
import 'register_module.dart' as _i804;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i304.PhotosApiService>(
        () => registerModule.apiService(gh<_i361.Dio>()));
    gh.factory<_i509.PhotosRemoteDataSource>(
        () => _i875.PhotosApiRemoteDataSource(gh<_i304.PhotosApiService>()));
    gh.factory<_i267.PhotosRepo>(() =>
        _i621.PhotosRepoImpl(dataSource: gh<_i509.PhotosRemoteDataSource>()));
    gh.factory<_i440.GetPhotosUseCase>(
        () => _i440.GetPhotosUseCase(repo: gh<_i267.PhotosRepo>()));
    gh.factory<_i101.PhotosViewModel>(
        () => _i101.PhotosViewModel(useCase: gh<_i440.GetPhotosUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i804.RegisterModule {}
