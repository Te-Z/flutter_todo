import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends DataClass implements Insertable<Photo>{
  @EntityPrimaryKey()
  int id;
  @EntityColumn()
  int albumId;
  @EntityColumn()
  String title;
  @EntityColumn()
  String url;
  @EntityColumn()
  String thumbnailUrl;


  Photo({@required this.id, @required this.albumId, @required this.title, @required this.url, @required this.thumbnailUrl});

  @override
  UpdateCompanion<Photo> createCompanion(bool nullToAbsent) =>
      _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@UseDao(entity: Photo)
class PhotoDao extends DatabaseAccessor<MyDatabase> with _$PhotoDaoMixin {
  PhotoDao(MyDatabase db) : super(db);

  Future<int> insertPhoto(PhotosCompanion companion) => update(photos).write(companion);
  Future<List<Photo>> getAllPhotos() => select(photos).get();
}