import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:photo_gallery/core/di/di.dart';
import 'package:photo_gallery/features/home/data/local_storage/photo_adapter.dart';
import 'package:photo_gallery/features/home/data/local_storage/photos_response_adapter.dart';
import 'package:photo_gallery/features/home/data/local_storage/src_adapter.dart';
import 'package:photo_gallery/features/home/data/models/photos_response.dart';
import 'package:photo_gallery/features/home/presentation/provider/theme_provider.dart';
import 'package:photo_gallery/photo_gallery_app.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SrcAdapter());
  Hive.registerAdapter(PhotoAdapter());
  Hive.registerAdapter(PhotosResponseAdapter());

  await Hive.openBox<PhotosResponse>('photosBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const PhotoGalleryApp(),
    ),
  );
}
