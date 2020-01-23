import 'package:equatable/equatable.dart';
import 'package:todo_poc/models/user.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<User> users;

  const UsersLoaded([this.users = const []]);

  @override
  List<User> get props => users;

  @override
  String toString() => 'UsersLoaded { users: $users }';
}

class UsersNotLoaded extends UserState {}