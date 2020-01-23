import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/user_event.dart';
import 'package:todo_poc/blocs/user_repository.dart';
import 'package:todo_poc/blocs/user_state.dart';
import 'package:todo_poc/models/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository repository = UsersRepository();

  @override
  UserState get initialState => UsersLoading();

  @override
  Stream<UserState> mapEventToState(event) async*{
    print("mapEventToState = $event");
    if (event is LoadUsers) {
      yield* _mapLoadUsersToState();
    } else if (event is AddUser) {
      yield* _mapAddUserToState(event);
    }
  }

  Stream<UserState> _mapLoadUsersToState() async* {
    try {
      final users = await this.repository.getAllUsers();
      yield UsersLoaded(users);
    } catch (e){
      print("_mapLoadUsersToState: UsersNotLoaded ==> $_mapLoadUsersToState");
      yield UsersNotLoaded();
    }
  }

  Stream<UserState> _mapAddUserToState(AddUser event) async* {
    if(state is UsersLoaded){
      final List<User> updatedUsers = List.from((state as UsersLoaded).users)
          ..add(event.user);

      yield UsersLoaded(updatedUsers);
      print("updatedUsers[0]: ${updatedUsers[0]}");
      repository.addUserEntry(updatedUsers[0].createCompanion(true));
    }
  }

}
