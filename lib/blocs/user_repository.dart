import 'package:todo_poc/api_provider/user_api_provider.dart';
import 'package:todo_poc/db/my_database.dart';
import 'package:todo_poc/models/user.dart';
import 'package:http/http.dart' show Client;

class UsersRepository {
  final UserDao _dao = UserDao(MyDatabase.sharedInstance);
  static Client _client = Client();
  final UserApiProvider _apiProvider = UserApiProvider(client: _client);

  Future<List<User>> getAllUsers() {
    // TODO: synchroniser base distante et base locale => https://proandroiddev.com/flutter-bookshelf-app-part-3-managing-data-the-right-way-30569abf9487
    return _apiProvider.getAllUsers();
    //_dao.getAllUsers();
  }

  Future<int> addUserEntry(UsersCompanion entry) async => await _dao.insertUser(entry);
}