import 'package:json_annotation/json_annotation.dart';


part 'src.g.dart';


/// original : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg"
/// large2x : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
/// large : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
/// medium : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&h=350"
/// small : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&h=130"
/// portrait : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800"
/// landscape : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"
/// tiny : "https://images.pexels.com/photos/33147349/pexels-photo-33147349.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"

@JsonSerializable()
class Src {
  Src({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  // factory Src.fromJson(dynamic json) {
  //   return Src(
  //     original: json['original'],
  //     large2x: json['large2x'],
  //     large: json['large'],
  //     medium: json['medium'],
  //     small: json['small'],
  //     portrait: json['portrait'],
  //     landscape: json['landscape'],
  //     tiny: json['tiny'],
  //   );
  // }

  factory Src.fromJson(Map<String, dynamic> json) =>
      _$SrcFromJson(json);

  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;
}
