import 'package:todo_poc/dao/dao.dart';
import 'package:todo_poc/db/db_provider.dart';
import 'package:todo_poc/models/photo.dart';

class PhotoDao implements Dao<Photo> {
  final DBProvider _dbProvider;
  final tableName = 'photos';

  PhotoDao(this._dbProvider);

  @override
  List<Photo> fromList(List<Map<String, dynamic>> query) {
    List<Photo> photos = List<Photo>();
    for(Map map in query){
      photos.add(fromMap(map));
    }
    return photos;
  }

  @override
  Photo fromMap(Map<String, dynamic> query) => Photo(
    id: query['id'] as int,
    albumId: query['albumId'] as int,
    title: query['title'] as String,
    url: query['url'] as String,
    thumbnailUrl: query['thumbnailUrl'] as String,
  );

  @override
  Map<String, dynamic> toMap(Photo object) => <String, dynamic>{
    'id': object.id,
    'albumId': object.albumId,
    'title': object.title,
    'url': object.url,
    'thumbnailUrl': object.thumbnailUrl,
  };

  Future<List<Photo>> getAllPhotos() async {
    final db = await _dbProvider.database;
    List<Map> maps = await db.query(tableName);
    return fromList(maps);
  }

  Future<Photo> addPhotoEntry(Photo photo) async {
    final db = await _dbProvider.database;

    List<Map> map = await db.query(tableName, where: "id = ?", whereArgs: [photo.id]);

    if(map.isNotEmpty){
      await db.delete(tableName, where: "id = ?", whereArgs: [photo.id]);
    }

    photo.id = await db.insert(tableName, toMap(photo));
    print("addPhotoEntry: new entry = ${photo.id}");
    return photo;
  }

  Future<Photo> deletePhoto(Photo photo) async {
    final db = await _dbProvider.database;
    await db.delete(tableName, where: "id = ?", whereArgs: [photo.id]);
    return photo;
  }
}