import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(img, fit: BoxFit.cover),
      //CachedNetworkImage(
      //               height: 100.h,
      //               width: 100.w,
      //               fit: BoxFit.cover,
      //               imageUrl: category.image,
      //               placeholder: (context, url) =>
      //                   const Center(child: CircularProgressIndicator()),
      //               errorWidget: (context, url, error) =>
      //                   const Center(child: Icon(Icons.error)),
      //               imageBuilder: (context, imageProvider) {
      //                 return Container(
      //                   decoration: BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     image: DecorationImage(
      //                       image: imageProvider,
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
    );
  }
}

