import 'package:equatable/equatable.dart';
import 'package:todo_poc/blocs/todo/todo_repository.dart';
import 'package:todo_poc/db/my_database.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {}

class AddTodo extends TodosEvent {
  final Todo todo;

  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class UpdateTodo extends TodosEvent {
  final Todo todo;

  const UpdateTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $todo }';
}

class DeleteTodo extends TodosEvent {
  final Todo todo;

  const DeleteTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'DeleteTodo { todo: $todo }';
}

class ClearCompleted extends TodosEvent {}

class ToggleAll extends TodosEvent {}