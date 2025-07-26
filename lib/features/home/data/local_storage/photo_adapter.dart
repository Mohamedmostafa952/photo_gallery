import 'package:hive/hive.dart';
import '../models/photo.dart';
import '../models/src.dart';

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 0;

  @override
  Photo read(BinaryReader reader) {
    return Photo(
      id: reader.readInt(),
      width: reader.readInt(),
      height: reader.readInt(),
      url: reader.readString(),
      photographer: reader.readString(),
      photographerUrl: reader.readString(),
      photographerId: reader.readInt(),
      avgColor: reader.readString(),
      src: reader.read() as Src,
      liked: reader.readBool(),
      alt: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer.writeInt(obj.id);
    writer.writeInt(obj.width);
    writer.writeInt(obj.height);
    writer.writeString(obj.url);
    writer.writeString(obj.photographer);
    writer.writeString(obj.photographerUrl);
    writer.writeInt(obj.photographerId);
    writer.writeString(obj.avgColor);
    writer.write(obj.src);
    writer.writeBool(obj.liked);
    writer.writeString(obj.alt);
  }
}
