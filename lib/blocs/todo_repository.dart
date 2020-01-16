import 'package:todo_poc/db/my_database.dart';

class TodosRepository {
  final TodosDao dao;

  TodosRepository(this.dao);

  Future<List<Todo>> getAllTodos() async => await dao.allTodos;
  Stream<List<Todo>> watchAllTodos() => dao.watchAllTodos;
  Future<int> addTodoEntry(TodosCompanion entry) async => await dao.addTodoEntry(entry);
  Future updateTodoEntry(TodosCompanion entry) async => await dao.updateTodoEntry(entry);
  Future deleteTodo(TodosCompanion entry) async => await dao.deleteTodo(entry);
}