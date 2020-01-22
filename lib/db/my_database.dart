import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/models/user.dart';

part 'my_database.g.dart';

@UseMoor(daos: [UserDao])
class MyDatabase extends _$MyDatabase{
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',));

  static MyDatabase sharedInstance = MyDatabase();

  @override
  int get schemaVersion => 1;
}