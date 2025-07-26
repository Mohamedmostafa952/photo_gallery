import 'package:hive/hive.dart';
import '../models/photo.dart';
import '../models/photos_response.dart';

class PhotosResponseAdapter extends TypeAdapter<PhotosResponse> {
  @override
  final int typeId = 2;

  @override
  PhotosResponse read(BinaryReader reader) {
    return PhotosResponse(
      page: reader.readInt(),
      perPage: reader.readInt(),
      photos: reader.readList().cast<Photo>(),
      totalResults: reader.readInt(),
      nextPage: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, PhotosResponse obj) {
    writer.writeInt(obj.page);
    writer.writeInt(obj.perPage);
    writer.writeList(obj.photos);
    writer.writeInt(obj.totalResults);
    writer.writeString(obj.nextPage);
  }
}
