import 'package:moor/moor.dart';
import 'package:todo_poc/db/tables.dart';

@UseDao(tables: [Todos])
class TodosDao extends DatabaseAccessor<MyDatabase> with _$TodosDaoMixin {
  TodosDao(MyDatabase db) : super(db);

  Future<List<Todo>> get allTodos => select(todos).get();

  Stream<List<Todo>> get watchAllTodos => select(todos).watch();
}