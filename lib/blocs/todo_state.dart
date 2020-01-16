import 'package:equatable/equatable.dart';
import 'package:todo_poc/models/todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  final List<Todo> todos;

  const TodosLoaded([this.todos = const []]);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TdosLoaded { todos: $todos }';
}

class TodosNotLoaded extends TodoState {}