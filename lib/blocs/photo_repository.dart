import 'package:todo_poc/api_provider/photo_api_provider.dart';
import 'package:todo_poc/db/my_database.dart';
import 'package:todo_poc/models/photo.dart';
import 'package:http/http.dart' show Client;

class PhotosRepository {
  final PhotoDao _dao = PhotoDao(MyDatabase.sharedInstance);
  static Client _client = Client();
  final PhotoApiProvider _apiProvider = PhotoApiProvider(client: _client);

  Future<List<Photo>> getAllPhotos() {
    // TODO: synchroniser base distante et base locale => https://proandroiddev.com/flutter-bookshelf-app-part-3-managing-data-the-right-way-30569abf9487
    return _apiProvider.getAllPhotos();
    //_dao.getAllUsers();
  }

  Future<int> addPhotoEntry(PhotosCompanion entry) async => await _dao.insertPhoto(entry);
}