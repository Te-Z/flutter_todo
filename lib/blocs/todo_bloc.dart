import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/todo_event.dart';
import 'package:todo_poc/blocs/todo_repository.dart';
import 'package:todo_poc/blocs/todo_state.dart';
import 'package:todo_poc/db/my_database.dart';

class TodoBloc extends Bloc<TodosEvent, TodoState> {
  final TodosRepository repository;

  TodoBloc(this.repository);

  @override
  TodoState get initialState => TodosLoading();

  @override
  Stream<TodoState> mapEventToState(event) async*{
    if (event is LoadTodos) {
      yield* _mapLoadTodosToState();
    } else if (event is AddTodo) {
      yield* _mapAddTodoToState(event);
    } else if (event is UpdateTodo) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is DeleteTodo) {
      yield* _mapDeleteTodoToState(event);
    }
  }

  Stream<TodoState> _mapLoadTodosToState() async* {
    try {
      final todos = await this.repository.getAllTodos();
      yield TodosLoaded(todos);
    } catch (e){
      print("_mapLoadTodosToState: TodosNotLoaded ==> $_mapLoadTodosToState");
      yield TodosNotLoaded();
    }
  }

  Stream<TodoState> _mapAddTodoToState(AddTodo event) async* {
    if(state is TodosLoaded){
      final List<Todo> updatedTodos = List.from((state as TodosLoaded).todos)
          ..add(event.todo);

      yield TodosLoaded(updatedTodos);
      repository.addTodoEntry(updatedTodos[0]);
    }
  }

  Stream<TodoState> _mapUpdateTodoToState(UpdateTodo event) async* {
    if(state is TodosLoaded){
      final List<Todo> updatedTodos = (state as TodosLoaded)
          .todos
          .where((todo) => todo.id != event.todo.id)
          .toList();

      yield TodosLoaded(updatedTodos);
      repository.updateTodoEntry(updatedTodos[0]);
    }
  }

  Stream<TodoState> _mapDeleteTodoToState(DeleteTodo event) async*{
    if(state is TodosLoaded){
      final updatedTodos = (state as TodosLoaded)
          .todos
          .where((todo) => todo.id != event.todo.id)
          .toList();
      yield TodosLoaded(updatedTodos);
      repository.deleteTodo(updatedTodos[0]);
    }
  }

}
