import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_poc/todo.dart';

@immutable
abstract class TodosState extends Equatable {
  TodosState([List props = const []]);
}

class TodosLoading extends TodosState {
  @override
  String toString() => 'TodosLoading';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  TodosLoaded([this.todos = const []]);


  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() => 'TodosLoaded { todos: $todos }';
}

class TodosNotLoaded extends TodosState {
  @override
  String toString() => 'TodosNotLoaded';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

