import 'package:equatable/equatable.dart';
import 'package:todo_poc/models/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UserEvent {}

class AddUser extends UserEvent {
  final User user;

  const AddUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AddUser { user: $user }';
}

class UpdateUser extends UserEvent {
  final User user;

  const UpdateUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UpdateUser { updatedUser: $user }';
}

class DeleteUser extends UserEvent {
  final User user;

  const DeleteUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'DeleteUser { user: $user }';
}

class ClearCompleted extends UserEvent {}

class ToggleAll extends UserEvent {}