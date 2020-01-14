import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_poc/todo.dart';

@immutable
abstract class TodosEvent extends Equatable {

  TodosEvent([List props = const []]);
}

class LoadTodos extends TodosEvent {
  @override
  String toString() => 'LoadTodos';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class AddTodo extends TodosEvent {
  final Todo todo;

  AddTodo(this.todo);

  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class UpdateTodo extends TodosEvent {
  final Todo updatedTodo;

  UpdateTodo(this.updatedTodo);

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedTodo }';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class DeleteTodo extends TodosEvent {
  final Todo todo;

  DeleteTodo(this.todo);

  @override
  String toString() => 'DeleteTodo { todo: $todo }';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClearCompleted extends TodosEvent {
  @override
  String toString() => 'ClearCompleted';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ToggleAll extends TodosEvent {
  @override
  String toString() => 'ToggleAll';

  @override
  // TODO: implement props
  List<Object> get props => null;
}