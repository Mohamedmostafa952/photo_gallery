import 'package:flutter/material.dart';
import 'package:photo_gallery/features/home/presentation/provider/theme_provider.dart';
import 'package:photo_gallery/photo_gallery_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const PhotoGalleryApp(),
    ),
  );
}
