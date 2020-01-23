import 'package:todo_poc/api_provider/photo_api_provider.dart';
import 'package:todo_poc/dao/photo_dao.dart';
import 'package:todo_poc/db/db_provider.dart';
import 'package:todo_poc/models/photo.dart';
import 'package:http/http.dart' show Client;

class PhotosRepository {
  final PhotoDao _dao = PhotoDao(_dbProvider);
  static DBProvider _dbProvider = DBProvider.db;

  static Client _client = Client();
  final PhotoApiProvider _apiProvider = PhotoApiProvider(client: _client);
  // TODO: synchroniser base distante et base locale => https://proandroiddev.com/flutter-bookshelf-app-part-3-managing-data-the-right-way-30569abf9487

  Future<List<Photo>> getAllPhotosFromNetwork() => _apiProvider.getAllPhotos();

  Future<List<Photo>> getAllPhotosFromDB() => _dao.getAllPhotos();

  Future<Photo> addPhotoEntry(Photo entry) => _dao.addPhotoEntry(entry);

  Future<Photo> deletePhoto(Photo entry) => _dao.deletePhoto(entry);
}