

import 'package:json_annotation/json_annotation.dart';
import 'src.dart';

part 'photo.g.dart';
/// id : 33147349
/// width : 2560
/// height : 3840
/// url : "https://www.pexels.com/photo/serene-sunrise-over-misty-riverside-landscape-33147349/"
/// photographer : "Vedat Uğurlu"
/// photographer_url : "https://www.pexels.com/@vedat-ugurlu-3699542"
/// photographer_id : 3699542
/// avg_color : "#564C40"
/// src : {"original":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg","large2x":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","large":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&h=650&w=940","medium":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&h=350","small":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&h=130","portrait":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800","landscape":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200","tiny":"https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"}
/// liked : false
/// alt : ""

@JsonSerializable()
class Photo {
  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  // factory Photo.fromJson(dynamic json) {
  //   return Photo(
  //     id: json['id'],
  //     width: json['width'],
  //     height: json['height'],
  //     url: json['url'],
  //     photographer: json['photographer'],
  //     photographerUrl: json['photographer_url'],
  //     photographerId: json['photographer_id'],
  //     avgColor: json['avg_color'],
  //     src: Src.fromJson(json['src']),
  //     liked: json['liked'],
  //     alt: json['alt'],
  //   );
  // }

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  @JsonKey(name: 'photographer_url')
  final String photographerUrl;
  @JsonKey(name: 'photographer_id')
  final int photographerId;
  @JsonKey(name: 'avg_color')
  final String avgColor;
  final Src src;
  final bool liked;
  final String alt;
}
