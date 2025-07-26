import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/features/home/data/models/photo.dart';
import 'package:photo_gallery/features/home/domain/entities/photo_entity.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({super.key, required this.photo});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: photo.width / photo.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: photo.originalSrc,
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
