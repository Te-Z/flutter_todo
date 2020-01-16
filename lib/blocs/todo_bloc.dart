import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/todo_event.dart';
import 'package:todo_poc/blocs/todo_state.dart';

class TodoBloc extends Bloc<TodosEvent, TodoState> {
  @override
  // TODO: implement initialState
  TodoState get initialState => null;

  @override
  Stream<TodoState> mapEventToState(event) {
    // TODO: implement mapEventToState
    return null;
  }

}