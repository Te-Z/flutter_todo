import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/tables.dart';

part 'my_database.g.dart';

@UseMoor(tables: [Todos], daos: [TodosDao])
class MyDatabase extends _$MyDatabase{
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Todos])
class TodosDao extends DatabaseAccessor<MyDatabase> with _$TodosDaoMixin {
  TodosDao(MyDatabase db) : super(db);

  Future<List<Todo>> get allTodos => select(todos).get();
  Stream<List<Todo>> get watchAllTodos => select(todos).watch();
}