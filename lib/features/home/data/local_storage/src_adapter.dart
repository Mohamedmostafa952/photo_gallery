import 'package:hive/hive.dart';
import 'package:photo_gallery/features/home/data/models/src.dart';



class SrcAdapter extends TypeAdapter<Src> {
  @override
  final int typeId = 1;

  @override
  Src read(BinaryReader reader) {
    return Src(
      original: reader.readString(),
      large2x: reader.readString(),
      large: reader.readString(),
      medium: reader.readString(),
      small: reader.readString(),
      portrait: reader.readString(),
      landscape: reader.readString(),
      tiny: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Src obj) {
    writer.writeString(obj.original);
    writer.writeString(obj.large2x);
    writer.writeString(obj.large);
    writer.writeString(obj.medium);
    writer.writeString(obj.small);
    writer.writeString(obj.portrait);
    writer.writeString(obj.landscape);
    writer.writeString(obj.tiny);
  }
}
