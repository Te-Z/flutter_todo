import 'package:todo_poc/db/my_database.dart';

class TodosRepository {
  final TodosDao dao;

  TodosRepository(this.dao);

  Future<List<Todo>> getAllTodos() async => await dao.allTodos;
  Stream<List<Todo>> watchAllTodos() => dao.watchAllTodos;
  Future<int> addTodoEntry(Todo entry) async => await dao.addTodoEntry(entry);
  Future updateTodoEntry(Todo entry) async => await dao.updateTodoEntry(entry);
  Future deleteTodo(Todo entry) async => await dao.deleteTodo(entry);
}