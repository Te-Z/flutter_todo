import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/dao/todos_dao.dart';

part 'tables.g.dart';

class Todos extends Table {

  BoolColumn get isComplete => boolean().named('isComplete')();
  TextColumn get id => text().named('id').customConstraint('UNIQUE')();
  TextColumn get note => text().named('note')();
  TextColumn get task => text().named('task')();

  @override
  Set<Column> get primaryKey => {id};
}

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