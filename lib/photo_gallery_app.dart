import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/core/resources/theme_manager.dart';
import 'package:photo_gallery/core/routes_manager/routes.dart';
import 'package:photo_gallery/core/routes_manager/routes_generator.dart';
import 'package:photo_gallery/features/home/presentation/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({super.key});

  @override
  State<PhotoGalleryApp> createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {

  late ThemeProvider themeProvider;


  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: Size(432, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          initialRoute: Routes.homeRoute,
          onGenerateRoute: RoutesGenerator.getRoute,
          theme: ThemeManager.light,
          darkTheme: ThemeManager.dark,
          themeMode: themeProvider.currentTheme,
        );
      },
    );
  }
}
